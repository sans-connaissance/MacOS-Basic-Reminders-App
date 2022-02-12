//
//  AddNewListViewModel.swift
//  RemindersMacOS
//
//  Created by David Malicke on 2/12/22.
//

import Foundation
import CoreData
import SwiftUI


class AddNewListViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var color: Color = .blue
    
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func save() {
        
        let myList = MyList(context: context)
        myList.name = name
        myList.color = NSColor(color)
        
    }
}
