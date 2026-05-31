//
//  ChatViewModel.swift
//  Chatting
//
//  Created by Sade El Moudden on 31.05.2026.
//
import Foundation
internal import Combine

class ChatViewModel: ObservableObject {
    @Published var messageText = ""
    let user: User
    
    init(user: User){
        self.user = user
    }
    func sendMessage () {
        MessageService.sendMessage(messageText, toUser: user)
    }

}
