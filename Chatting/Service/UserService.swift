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
    @Published  var currentUser: User?
    static let shared = UserService()
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        
    }
    
    static func fetchAllUser() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({try? $0.data(as: User.self)})
    }
    
    
    static func fetchUser(withUid uid: String, completion: @escaping (User) -> Void) {
        FirestoreConstants.UserCollection.document(uid).getDocument { snapshot, _ in
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
