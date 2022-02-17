//
//  HomeScreen.swift
//  RemindersMacOS
//
//  Created by David Malicke on 2/12/22.
//

import SwiftUI

struct HomeScreen: View {
    
    @Environment(\.managedObjectContext) var context: NSManagedObjectContext
    
    var body: some View {
        NavigationView {
            
            let myListVM = MyListsViewModel(context: context)
            let firstListVM = myListVM.myLists.first
            
            SideBarView()
                .frame(minWidth: 200)
            
            if let firstListVM = firstListVM {
                MyListItemsHeaderView(name: firstListVM.name, count: firstListVM.itemsCount, color: firstListVM.color)
                MyListItemsView(items: firstListVM.items)
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
