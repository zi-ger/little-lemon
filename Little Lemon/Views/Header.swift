//
//  Header.swift
//  Little Lemon
//
//  Created by Gustavo Ziger on 30/03/24.
//

import SwiftUI

struct Header: View {
    var body: some View {
        HStack {
            Spacer()
            Image("logo")
            Spacer()
            Image("profile-image-placeholder")
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(25)
        }
    }
}

#Preview {
    Header()
}
