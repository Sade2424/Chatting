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
    @Published var messages = [Message]()
    let service: ChatService
    
    init(user: User){
        self.service = ChatService(chatPartner: user)
        observeMessages()
    }
    
    func observeMessages() {
        service.observeMessages() { messages in
            self.messages.append(contentsOf: messages)
        }
    }
    
    func sendMessage () {
        service.sendMessage(messageText)
    }

}
