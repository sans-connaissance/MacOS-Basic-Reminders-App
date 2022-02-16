//
//  MyListsViewModel.swift
//  RemindersMacOS
//
//  Created by David Malicke on 2/12/22.
//

import Foundation
import CoreData
import SwiftUI

class MyListsViewModel: NSObject, ObservableObject {
    
    @Published var myLists = [MyListViewModel]()
    private let fetchedResultsController: NSFetchedResultsController<MyList>
    private var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
        fetchedResultsController = NSFetchedResultsController(fetchRequest: MyList.all, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        fetchedResultsController.delegate = self
        setupObservers()
        fetchAll()
        
    }
    
    private func setupObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(managedObjectContextObjectsDidChange), name: NSNotification.Name.NSManagedObjectContextObjectsDidChange, object: context)
    }
    
    @objc func managedObjectContextObjectsDidChange(notification: NSNotification) {
        guard let userInfo = notification.userInfo else {return}
        
        if let updates = userInfo[NSUpdatedObjectsKey] as? Set<MyListItem>, updates.count > 0 {
            fetchAll()
        }
    }
    
    func saveTo(list: MyListViewModel, title: String, dueDate: Date?) {
        let myListItem = MyListItem(context: context)
        myListItem.title = title
        myListItem.dueDate = dueDate
        myListItem.myList = MyList.byId(id: list.id)
        
        
        do {
            try myListItem.save()
        } catch {
            print(error)
        }
    }
    
    private func fetchAll() {
        do {
            try fetchedResultsController.performFetch()
            guard let myLists = fetchedResultsController.fetchedObjects else {
                return
            }
            self.myLists = myLists.map(MyListViewModel.init)
        } catch  {
            print(error)
        }
    }
    
    func deleteItem(_ item: MyListItemViewModel) {
        let myListItem: MyListItem? = MyListItem.byId(id: item.listItemId)
        if let myListItem = myListItem {
            try? myListItem.delete()
        }
    }
    
    func markAsCompleted(_ item: MyListItemViewModel) {
        let myListItem: MyListItem? = MyListItem.byId(id: item.listItemId)
        if let myListItem = myListItem {
            myListItem.isCompleted = true
            try? myListItem.save()
        }
    }
    
    func delete(_ myList: MyListViewModel) {
        let myList: MyList? = MyList.byId(id: myList.id)
        if let myList = myList {
            try? myList.delete()
        }
    }
    
}

extension MyListsViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let myLists = controller.fetchedObjects as? [MyList] else {
            return
        }

        self.myLists = myLists.map(MyListViewModel.init)
    }
}
