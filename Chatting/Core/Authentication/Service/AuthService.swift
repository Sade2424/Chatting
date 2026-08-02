//
//  AuthService.swift
//  Chatting
//
//  Created by Sade El Moudden on 17.04.2026.
//

import Foundation
import Firebase
import FirebaseAuth
internal import Combine
import FirebaseFirestore
import GoogleSignIn

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        Task { await ensureFirestoreUserExists() }
        print("DEBUG: User session id is \(String(describing: userSession?.uid))")
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            loadCurrentUserData()
        } catch {
            print("DEBUG: Failed to sign in user with error: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func signInWithGoogle(user: GIDGoogleUser) async throws {
        guard let idToken = user.idToken?.tokenString else {
            print("DEBUG: Failed to get Google ID token")
            return
        }

        let accessToken = user.accessToken.tokenString
        let credential = GoogleAuthProvider.credential(
            withIDToken: idToken,
            accessToken: accessToken
        )

        do {
            let result = try await Auth.auth().signIn(with: credential)
            self.userSession = result.user

            let docRef = Firestore.firestore().collection("users").document(result.user.uid)
            let snapshot = try await docRef.getDocument()

            if !snapshot.exists {
                let fullname = result.user.displayName ?? user.profile?.name ?? ""
                let email = result.user.email ?? user.profile?.email ?? ""
                try await uploadUserData(email: email, fullname: fullname, id: result.user.uid)
            }

            try await UserService.shared.fetchCurrentUser()
        } catch {
            print("DEBUG: Failed to sign in with Google: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await self.uploadUserData(email: email, fullname: fullname, id: result.user.uid)
            loadCurrentUserData()
        } catch {
            print("DEBUG: Failed to create user with error: \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            UserService.shared.currentUser = nil
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    private func uploadUserData(email: String, fullname: String, id: String) async throws {
        let user = User(fullname: fullname, email: email, profileImageName: nil)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else {
            print("DEBUG: Failed to encode user data for Firestore")
            return
        }
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
    }

    @MainActor
    private func ensureFirestoreUserExists() async {
        guard let firebaseUser = Auth.auth().currentUser else { return }

        let docRef = Firestore.firestore().collection("users").document(firebaseUser.uid)

        do {
            let snapshot = try await docRef.getDocument()

            if !snapshot.exists {
                let fullname = firebaseUser.displayName ?? ""
                let email = firebaseUser.email ?? ""
                try await uploadUserData(email: email, fullname: fullname, id: firebaseUser.uid)
            }

            try await UserService.shared.fetchCurrentUser()
        } catch {
            print("DEBUG: Failed to ensure Firestore user exists: \(error.localizedDescription)")
        }
    }

    private func loadCurrentUserData() {
        Task { await ensureFirestoreUserExists() }
    }
}
