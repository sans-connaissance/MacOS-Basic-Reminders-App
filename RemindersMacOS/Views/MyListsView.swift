//
//  MyListsView.swift
//  RemindersMacOS
//
//  Created by David Malicke on 2/12/22.
//

import SwiftUI

struct MyListsView: View {
    
    @StateObject var vm: MyListsViewModel
    
    init(vm: MyListsViewModel) {
        _vm = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            List {
                AllCountView(count: vm.allListItemsCount)
                Text("My List")
                ForEach(vm.myLists) { myList in
                    
                    NavigationLink {
                        MyListItemsHeaderView(name: myList.name, count: myList.itemsCount, color: myList.color)
                        MyListItemsView(items: myList.items, onItemAdded: { title, dueDate in
                            vm.saveTo(list: myList, title: title, dueDate: dueDate)
                        }, onItemDeleted: vm.deleteItem, onItemCompleted: vm.markAsCompleted)
                    } label: {
                        HStack {
                            Image(systemName: Constants.Icons.line3HorizontalCircleFill)
                                .font(.title)
                                .foregroundColor(myList.color)
                            Text(myList.name)
                            Spacer()
                            Text("\(myList.itemsCount)")
                        }
                    }.contextMenu{
                        Button {
                            vm.delete(myList)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                        
                    }
                }
            }
        }
    }
}

struct MyListsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = CoreDataManager.shared.persistentContainer.viewContext
        MyListsView(vm: MyListsViewModel(context: viewContext))
    }
}
