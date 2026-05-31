//
//  Message.swift
//  Chatting
//
//  Created by Sade El Moudden on 31.05.2026.
//
import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth

struct Message: Identifiable, Codable, Hashable {
    @DocumentID var messageId: String?
    let fromId: String
    let toId: String
    let messageText: String
    let timestamp: Timestamp
    var user: User?
    var id: String {
        return messageId ?? NSUUID().uuidString
    }
    var chatPartnerId: String {
        return fromId == Auth.auth().currentUser?.uid ? toId : fromId
    }
    var isFromCurrentUser: Bool {
        return fromId == Auth.auth().currentUser?.uid
    }
}

