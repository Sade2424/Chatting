//
//  User.swift
//  Chatting
//
//  Created by Sade El Moudden on 16.04.2026.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id = NSUUID().uuidString
    let fullname: String
    let email: String
    var profileImageUrl: String?
}
extension User {
    static let MOCK_USER = User(fullname: "Markus Poulpous", email: "markus@gmail.com", profileImageUrl: "Markus")
}




