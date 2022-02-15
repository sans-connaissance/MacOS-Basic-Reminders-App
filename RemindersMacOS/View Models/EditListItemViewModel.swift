//
//  EditListItemViewModel.swift
//  RemindersMacOS
//
//  Created by David Malicke on 2/14/22.
//

import Foundation

class EditListItemViewModel: ObservableObject {
    
    var listItemVM: MyListItemViewModel
    @Published var title: String = ""
    @Published var selectedDate: Date?
    
    init(listItemVM: MyListItemViewModel) {
        self.listItemVM = listItemVM
        title = listItemVM.title
        selectedDate = listItemVM.dueDate != nil ? (listItemVM.dueDate!.value) : nil
    }
    
}
