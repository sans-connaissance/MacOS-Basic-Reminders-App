//
//  HomeScreen.swift
//  RemindersMacOS
//
//  Created by David Malicke on 2/12/22.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationView {
            SideBarView()
                .frame(minWidth: 200)
            Text("MyListItems")
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
