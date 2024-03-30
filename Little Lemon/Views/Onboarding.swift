//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Gustavo Ziger on 30/03/24.
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kIsLoggedIn = "login key"

struct Onboarding: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    
    @State var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Header()
                Hero()
                NavigationLink(destination: Home(), isActive: $isLoggedIn) { }
                
                VStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("First Name *")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        TextField("First Name", text: $firstName)
                    }
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Last Name *")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        TextField("Last Name", text: $lastName)
                    }
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Email *")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        TextField("Email", text: $email)
                    }
                }
                .textFieldStyle(.roundedBorder)
                .padding()
                
                Button("Register") {
                    let udFirstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
                    let udLastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
                    let udEmail = UserDefaults.standard.string(forKey: kEmail) ?? ""
                    
                    if  udFirstName.isEmpty && udLastName.isEmpty && udEmail.isEmpty {
                        UserDefaults.standard.setValue(firstName, forKey: kFirstName)
                        UserDefaults.standard.setValue(lastName, forKey: kLastName)
                        UserDefaults.standard.setValue(email, forKey: kEmail)
                        
                        UserDefaults.standard.setValue(true, forKey: kIsLoggedIn)
                        
                        isLoggedIn = true
                    } else {
                        isLoggedIn = true
                    }
                }
                    .frame(width: 150, height: 40)
                    .cornerRadius(15)
                    .tint(.white)
                    .background(Color(red: 64 / 255, green: 83 / 255, blue: 77 / 255))
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear() {
            isLoggedIn = UserDefaults.standard.bool(forKey: kIsLoggedIn)
        }
    }
}

#Preview {
    Onboarding()
}
