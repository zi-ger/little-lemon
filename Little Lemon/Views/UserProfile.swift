//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Gustavo Ziger on 30/03/24.
//

import SwiftUI

struct UserProfile: View {
    let firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    let lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    let email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            Text("Personal Information")
            Image("profile-image-placeholder").resizable()
                .aspectRatio(contentMode: .fit)
            Text(firstName)
            Text(lastName)
            Text(email)
            
            Button("Logout") {
                UserDefaults.standard.removeObject(forKey: kFirstName)
                UserDefaults.standard.removeObject(forKey: kLastName)
                UserDefaults.standard.removeObject(forKey: kEmail)
                
                UserDefaults.standard.setValue(false, forKey: kIsLoggedIn)
                
                self.presentation.wrappedValue.dismiss()
            }
            Spacer()
        }
    }
}

#Preview {
    UserProfile()
}
