//
//  Menu.swift
//  Little Lemon
//
//  Created by Gustavo Ziger on 30/03/24.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        VStack {
            Text("Little Lemon")
            Text("Chicago")
            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
            List {}
        }
        .onAppear() {
            getMenuData()
        }
    }
    
    func getMenuData() {
        PersistenceController.shared.clear()
        
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")
        let request = URLRequest(url: url!)
        let urlSession = URLSession.shared
        
        urlSession.dataTask(with: request) { data, response, error in
            if let data = data {
                if let menuData = try? JSONDecoder().decode(MenuList.self, from: data) {
                    for item in menuData.menu {
                        let dish = Dish(context: viewContext)
                        dish.title = item.title
                        dish.image = item.image
                        dish.price = item.price
                    }
                    try? viewContext.save()
                }
            } else {
                print(error?.localizedDescription ?? "Error retrieving menu data.")
            }
        }.resume()
    }
}

#Preview {
    Menu()
}
