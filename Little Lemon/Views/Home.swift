//
//  Home.swift
//  Little Lemon
//
//  Created by Gustavo Ziger on 30/03/24.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView() {
            Menu().tabItem {
                Label("Menu", systemImage: "list.dash")
            }
            UserProfile().tabItem {
                Label("Profile", systemImage: "square.and.pencil")
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}
