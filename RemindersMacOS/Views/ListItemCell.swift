//
//  ListItemCell.swift
//  RemindersMacOS
//
//  Created by David Malicke on 2/14/22.
//

import SwiftUI

struct ListItemCell: View {
    
    @State private var active: Bool = false
    @State private var showPopOver: Bool = false
    let item: MyListItemViewModel
    
    var onListItemDeleted: (MyListItemViewModel) -> Void = {_ in}
    
    var body: some View {
        
        HStack(alignment: .firstTextBaseline) {
            Image(systemName: Constants.Icons.circle)
                .font(.system(size: 14))
                .opacity(0.2)
            
            VStack(alignment: .leading) {
                Text(item.title)
                if let dueDate = item.dueDate {
                    Text(dueDate.title)
                        .opacity(0.4)
                        .foregroundColor(dueDate.isPastDue ? .red : .primary)
                }
            }
            Spacer()
            if active {
                Image(systemName: "multiply.circle")
                    .foregroundColor(.red)
                    .onTapGesture {
                        onListItemDeleted(item)
                    }
                
                Image(systemName: Constants.Icons.exclaimationMarkCircle)
                    .foregroundColor(.purple)
                    .onTapGesture {
                        showPopOver = true
                    }.popover(isPresented: $showPopOver, arrowEdge: .leading) {
                        EditListItemView(item: item)
                    }
            }
        }
        .contentShape(Rectangle())
        .onHover { value in
            active = value
        }
    }
}

struct ListItemCell_Previews: PreviewProvider {
    static var previews: some View {
        ListItemCell(item: MyListItemViewModel(myListItem: MyListItem()))
    }
}
