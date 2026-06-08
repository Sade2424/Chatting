//
//  Constants.swift
//  Chatting
//
//  Created by Sade El Moudden on 07.06.2026.
//

import Foundation
import Firebase

struct FirestoreConstants {
    static let UserCollection = Firestore.firestore().collection("users")
    static let MessagesCollection = Firestore.firestore().collection("messages")
}
