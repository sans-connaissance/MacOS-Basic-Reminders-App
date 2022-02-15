//
//  MyListItemView.swift
//  RemindersMacOS
//
//  Created by David Malicke on 2/13/22.
//

import SwiftUI

struct MyListItemsView: View {
    
    var items: [MyListItemViewModel]
    
    typealias ItemAdded = ((String, Date?) -> Void)?
    var onItemAdded: ItemAdded
    
    init(items: [MyListItemViewModel], onItemAdded: ItemAdded = nil) {
        self.items = items
        self.onItemAdded = onItemAdded
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            List {
                
                ForEach(items, id: \.listItemID) { item in
                    ListItemCell(item: item)
                    Divider()
                }
                
                AddNewListItemView { title, dueDate in
                    onItemAdded?(title, dueDate)
                }
            }
        }
    }
}

struct MyListItemView_Previews: PreviewProvider {
    static var previews: some View {
        MyListItemsView(items: [])
    }
}
