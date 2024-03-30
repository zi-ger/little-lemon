//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Gustavo Ziger on 30/03/24.
//

import SwiftUI

struct UserProfile: View {
    @State var firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    @State var lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @State var email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            Text("Personal Information")
            Image("profile-image-placeholder").resizable()
                .aspectRatio(contentMode: .fit)
            
            TextField("First Name", text: $firstName)
            TextField("Last Name", text: $lastName)
            TextField("Email", text: $email)
            
            Button("Save changes") {
                UserDefaults.standard.setValue(firstName, forKey: kFirstName)
                UserDefaults.standard.setValue(lastName, forKey: kLastName)
                UserDefaults.standard.setValue(email, forKey: kEmail)
            }
            
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
