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
    
    @State var isLoggedOut: Bool = false
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(destination: Onboarding(), isActive: $isLoggedOut) { }
            Header()
            Text("Personal Information")
                .font(.system(size: 24))
                .bold()
            HStack() {
                Spacer()
                Image("profile-image-placeholder").resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 0) {
                Text("First Name")
                    .font(.system(size: 12))
                TextField("First Name", text: $firstName)
            }
            VStack(alignment: .leading, spacing: 0) {
                Text("Last Name")
                    .font(.system(size: 12))
                TextField("Last Name", text: $lastName)
            }
            VStack(alignment: .leading, spacing: 0) {
                Text("Email")
                    .font(.system(size: 12))
                TextField("Email", text: $email)
            }
            
            Button("Log out") {
                UserDefaults.standard.removeObject(forKey: kFirstName)
                UserDefaults.standard.removeObject(forKey: kLastName)
                UserDefaults.standard.removeObject(forKey: kEmail)
                
                UserDefaults.standard.setValue(false, forKey: kIsLoggedIn)
                isLoggedOut = true
            }
                .frame(maxWidth: .infinity)
                .tint(.black)
                .padding()
                .cornerRadius(25)
                .background(Color(red: 242 / 255, green: 199 / 255, blue: 52 / 255))
            
            HStack {
                Spacer()
                NavigationLink(destination: Menu()) {
                    Button("Discard changes") {}
                        .frame(width: 150, height: 40)
                        .cornerRadius(15)
                        .tint(.black)
                        .border(Color(red: 64 / 255, green: 83 / 255, blue: 77 / 255))
                }
                Button("Save changes") {
                    UserDefaults.standard.setValue(firstName, forKey: kFirstName)
                    UserDefaults.standard.setValue(lastName, forKey: kLastName)
                    UserDefaults.standard.setValue(email, forKey: kEmail)
                }
                    .frame(width: 150, height: 40)
                    .cornerRadius(15)
                    .tint(.white)
                    .background(Color(red: 64 / 255, green: 83 / 255, blue: 77 / 255))
                Spacer()
            }
            
            
            Spacer()
        }
        .padding()
        .textFieldStyle(.roundedBorder)
    }
}

#Preview {
    UserProfile()
}
