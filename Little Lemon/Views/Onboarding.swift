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
                NavigationLink(destination: Home(), isActive: $isLoggedIn) { }
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Email", text: $email)
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
            }
        }
        .onAppear() {
            isLoggedIn = UserDefaults.standard.bool(forKey: kIsLoggedIn)
        }
    }
}

#Preview {
    Onboarding()
}
