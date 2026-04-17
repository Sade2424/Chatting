//
//  RegistrationViewModel.swift
//  Chatting
//
//  Created by Sade El Moudden on 17.04.2026.
//

import SwiftUI
internal import Combine

class RegistrationViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    
    func createUser() async throws {
        try await AuthService().createUser(withEmail: email, password: password, fullname: fullname)
    }
    
}
