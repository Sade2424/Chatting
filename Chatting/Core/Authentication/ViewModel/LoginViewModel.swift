//
//  LoginViewModel.swift
//  Chatting
//
//  Created by Sade El Moudden on 17.04.2026.
//

import SwiftUI
internal import Combine

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws {
        try await AuthService().login(withEmail: email, password: password)
        
    }
    
}

