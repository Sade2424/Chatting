//
//  User.swift
//  Chatting
//
//  Created by Sade El Moudden on 16.04.2026.
//

import Foundation
import FirebaseFirestore

struct User: Codable, Identifiable, Hashable {
    @DocumentID var uid: String?
    let fullname: String
    let email: String
    var profileImageUrl: String?
    
    var id: String {
        return uid ?? NSUUID().uuidString
    }
}
extension User {
    static let MOCK_USER = User(fullname: "Markus Poulpous", email: "markus@gmail.com", profileImageUrl: "Markus")
}




