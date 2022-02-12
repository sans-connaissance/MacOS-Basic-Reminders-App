//
//  SideBarView.swift
//  RemindersMacOS
//
//  Created by David Malicke on 2/12/22.
//

import SwiftUI

struct SideBarView: View {
    var body: some View {
        VStack {
            Text("All Items Count 10")
            List(1...5, id: \.self) { index in
                Text("List \(index)")
                
            }
            Spacer()
            Button("Add List") {
                
            }
        }
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView()
    }
}
