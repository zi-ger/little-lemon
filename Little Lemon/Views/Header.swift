//
//  Header.swift
//  Little Lemon
//
//  Created by Gustavo Ziger on 30/03/24.
//

import SwiftUI

struct Header: View {
    @State var isLoggedIn = false
    
    var body: some View {
        HStack {
            Spacer()
            Image("logo")
            Spacer()
            if isLoggedIn {
                NavigationLink(destination: UserProfile()) {
                    Image("profile-image-placeholder")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(25)
                }
            }
            
        }.frame(height: 60)
        .onAppear() {
            isLoggedIn = UserDefaults.standard.bool(forKey: kIsLoggedIn)
        }
    }
}

#Preview {
    Header()
}
