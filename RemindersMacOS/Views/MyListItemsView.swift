//
//  MyListItemView.swift
//  RemindersMacOS
//
//  Created by David Malicke on 2/13/22.
//

import SwiftUI

struct MyListItemsView: View {
    var body: some View {
        VStack(alignment:.leading) {
            List(1...10, id: \.self) { index in
                Text("Item \(index)")
                
            }
        }
    }
}

struct MyListItemView_Previews: PreviewProvider {
    static var previews: some View {
        MyListItemsView()
    }
}
