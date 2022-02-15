//
//  ListItemCell.swift
//  RemindersMacOS
//
//  Created by David Malicke on 2/14/22.
//

import SwiftUI

struct ListItemCell: View {
    
    @State private var active: Bool = false
    let item: MyListItemViewModel
    
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
                        
                    }
                
                Image(systemName: Constants.Icons.exclaimationMarkCircle)
                    .foregroundColor(.purple)
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
