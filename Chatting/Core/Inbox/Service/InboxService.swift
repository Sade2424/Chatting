//
//  InboxService.swift
//  Chatting
//
//  Created by Sade El Moudden on 07.06.2026.
//

import Foundation
import Firebase
import FirebaseAuth
internal import Combine

class InboxService {
    @Published var documentChanges = [DocumentChange]()
    
    func obsserveRecentMessages() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let query = FirestoreConstants
            .MessagesCollection
            .document(uid)
            .collection("recent-messages")
            .order(by: "timestamp", descending: true)
        
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({
                $0.type == .added || $0.type == .modified
                
            }) else { return }
            
            self.documentChanges = changes
        }
    }
}
    

