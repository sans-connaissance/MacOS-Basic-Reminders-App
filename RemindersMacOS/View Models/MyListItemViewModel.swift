//
//  MyListItemViewModel.swift
//  RemindersMacOS
//
//  Created by David Malicke on 2/13/22.
//

import Foundation
import CoreData

struct MyListItemViewModel: Identifiable {
    private let myListItem: MyListItem
    let id = UUID()
    
    init(myListItem: MyListItem) {
        self.myListItem = myListItem
    }
    
    var title: String {
        myListItem.title ?? ""
    }
    
    
}
