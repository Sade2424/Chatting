//
//  NewMessageViewModel.swift
//  Chatting
//
//  Created by Sade El Moudden on 31.05.2026.
//

import Foundation
internal import Combine
import Firebase
import FirebaseAuth

@MainActor
class NewMessageViewModel: ObservableObject {
    @Published  var users = [User]()
    
    init() {
        Task { try await fetchUsers()}
        
    }
    
    func fetchUsers() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let users = try await UserService.fetchAllUser()
        self.users = users.filter({$0.id != currentUid})
        
    }
}

