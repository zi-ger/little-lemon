//
//  Hero.swift
//  Little Lemon
//
//  Created by Gustavo Ziger on 30/03/24.
//

import SwiftUI

struct Hero: View {
    @State var isLoggedIn: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Little Lemon")
                .font(.system(size: 50))
                .foregroundStyle(Color(red: 242 / 255, green: 199 / 255, blue: 52 / 255))
            Text("Chicago")
                .font(.system(size: 30))
                .foregroundStyle(.white)
            HStack {
                Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                    .font(.system(size: 16))
                    .foregroundStyle(.white)
                    .fixedSize(horizontal: false, vertical: true)
                Image("hero")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .cornerRadius(15)
            }
            if isLoggedIn {
                ZStack {
                    Circle().colorInvert()
                    Image(systemName: "magnifyingglass").foregroundStyle(Color.black)
                    
                }
                .frame(width: 30, height: 30)
                .padding([.leading])
            }
        }
        .onAppear() {
            isLoggedIn = UserDefaults.standard.bool(forKey: kIsLoggedIn)
        }
        .padding(15)
        .background(Color(red: 64 / 255, green: 83 / 255, blue: 77 / 255))
    }
}

#Preview {
    Hero()
}
