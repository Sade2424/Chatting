//
//  UserService.swift
//  Chatting
//
//  Created by Sade El Moudden on 31.05.2026.
//

import Foundation
internal import Combine
import Firebase
import FirebaseAuth
import FirebaseFirestore

class UserService {
    @Published var currentUser: User?
    static let shared = UserService()
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let snapshot = try await Firestore.firestore()
            .collection("users")
            .document(uid)
            .getDocument()

        guard snapshot.exists else {
            print("DEBUG: No Firestore user document found for uid \(uid)")
            return
        }

        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        
        print("DEBUG: Loaded current user \(user.fullname)")
    }
    
    
    // Update the user's selected avatar
    @MainActor
    func updateProfileImage(_ imageName: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else {
            print("DEBUG: No logged-in user found")
            return
        }

        try await Firestore.firestore()
            .collection("users")
            .document(uid)
            .updateData([
                "profileImageName": imageName
            ])

        print("DEBUG: Updated profile image to \(imageName)")
        
        // Reload the user so the UI updates
        try await fetchCurrentUser()
    }
    
    
    static func fetchAllUsers(limit: Int? = nil) async throws -> [User] {
        var query: Query = FirestoreConstants.UserCollection
        
        if let limit {
            query = query.limit(to: limit)
        }
        
        let snapshot = try await query.getDocuments()
        
        return snapshot.documents.compactMap {
            try? $0.data(as: User.self)
        }
    }
    static func fetchUser(withUid uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore()
            .collection("users")
            .document(uid)
            .getDocument()

        return try snapshot.data(as: User.self)
    }
    
    static func fetchUser(withUid uid: String, completion: @escaping (User) -> Void) {
        FirestoreConstants.UserCollection
            .document(uid)
            .getDocument { snapshot, _ in
                
                Task { @MainActor in
                    guard let snapshot = snapshot else { return }
                    guard let user = try? snapshot.data(as: User.self) else { return }
                    
                    completion(user)
                }
            }
        
    }
}
    
    
    
    
   // static func fetchUser (withUid uid: String, completion: @escaping(User) -> Void) {
    //    FirestoreConstants.UserCollection.document(uid).getDocument { snapshot, _ in
        //    guard let user = try? snapshot?.data(as: User.self) else { return }
         //   completion(user)
    //    }
        
   // }
//}
