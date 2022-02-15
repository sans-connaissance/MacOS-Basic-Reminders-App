//
//  EditListItemView.swift
//  RemindersMacOS
//
//  Created by David Malicke on 2/14/22.
//

import SwiftUI

struct EditListItemView: View {
    
    var item: MyListItemViewModel
    @State private var selectedDate: Date = Date.today
    @ObservedObject var editListItemVM: EditListItemViewModel
    @State private var showCalendar: Bool = false
    var onUpdated: () -> Void
    
    init(item: MyListItemViewModel, onUpdated: @escaping () -> Void) {
        self.item = item
        self.onUpdated = onUpdated
        editListItemVM = EditListItemViewModel(listItemVM: item)
    }
    
    var calendarButtonTitle: String {
        editListItemVM.selectedDate != nil ? editListItemVM.selectedDate!.formatAsString : "Add Date"
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField(item.title, text: $editListItemVM.title)
                .textFieldStyle(.plain)
            Divider()
            HStack {
                Text("Due Date:")
                CalendarButtonView(title: calendarButtonTitle, showCalendar: $showCalendar) { selectedDate in
                    editListItemVM.selectedDate = selectedDate
                }
            }
            Spacer()
            HStack {
                Spacer()
                Button("Done") {
                    editListItemVM.save()
                    onUpdated()
                }.buttonStyle(.borderedProminent)
            }
        }
        .padding()
        .frame(minWidth: 200, minHeight: 200)
    }
}

struct EditListItemView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = CoreDataManager.shared.persistentContainer.viewContext
        
        EditListItemView(item: MyListItemViewModel(myListItem: MyListItem(context: viewContext))) { }
    }
}
