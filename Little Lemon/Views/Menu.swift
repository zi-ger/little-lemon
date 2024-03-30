//
//  Menu.swift
//  Little Lemon
//
//  Created by Gustavo Ziger on 30/03/24.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var startersEnabled: Bool = false
    @State var mainsEnabled: Bool = false
    @State var dessertsEnabled: Bool = false
    @State var drinksEnabled: Bool = false
    
    var body: some View {
        VStack {
            Header()
            Hero()
            Text("ORDER FOR DELIVERY!")
                .font(.system(size: 20))
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.top, .leading])
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    Toggle("Starters", isOn: $startersEnabled)
                        .bold()
                        .accentColor(.black)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(12)
                    Toggle("Mains", isOn: $mainsEnabled)
                        .bold()
                        .accentColor(.black)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(12)
                    Toggle("Desserts", isOn: $dessertsEnabled)
                        .bold()
                        .accentColor(.black)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(12)
                    Toggle("Drinks", isOn: $drinksEnabled)
                        .bold()
                        .accentColor(.black)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(12)
                }
                .toggleStyle(.button)
                .padding(.horizontal)
            }
            Divider()
            
            FetchedObjects() { (dishes: [Dish]) in
                List {
                    ForEach(dishes) { dish in
                        HStack {
                            VStack {
                                Text(dish.title ?? "")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .bold()
                                    .foregroundColor(.black)
                                Spacer(minLength: 10)
                                Text("$" + (dish.price ?? ""))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundColor(.gray)
                                    .monospaced()
                            }
                            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(maxWidth: 90, maxHeight: 90)
                            .clipShape(Rectangle())
                        }
                        .padding(.vertical)
                        .frame(maxHeight: 150)
                    }
                }.listStyle(.plain)
            }
            Spacer()
        }
        .padding(10)
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
