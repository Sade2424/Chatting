//
//  LoginViewModel.swift
//  Chatting
//
//  Created by Sade El Moudden on 17.04.2026.
//

import SwiftUI
internal import Combine
import GoogleSignIn

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
        
    }
    
    @MainActor
    func signInWithGoogle() async {
        guard let rootVC = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .flatMap({ $0.windows })
            .first(where: { $0.isKeyWindow })?
            .rootViewController else {
            print("DEBUG: No root view controller")
            return
        }
        
        do {
            let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootVC)
            try await AuthService.shared.signInWithGoogle(user: result.user)
        } catch {
            print("DEBUG: Google Sign-In failed: \(error.localizedDescription)")
        }
    }
}
