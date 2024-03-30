//
//  Home.swift
//  Little Lemon
//
//  Created by Gustavo Ziger on 30/03/24.
//

import SwiftUI

struct Home: View {
    let persistence = PersistenceController()
    
    var body: some View {
        NavigationView() {
            Menu()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
                .environment(\.managedObjectContext, persistence.container.viewContext)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}
