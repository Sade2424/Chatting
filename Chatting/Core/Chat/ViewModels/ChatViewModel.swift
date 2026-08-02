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
        service.observeMessages() { [weak self] messages in
            
            Task {
                var updatedMessages = messages
                
                for index in updatedMessages.indices {
                    let senderID = updatedMessages[index].fromId
                    
                    if let sender = try? await UserService.fetchUser(withUid: senderID) {
                        updatedMessages[index].user = sender
                    }
                }
                
                await MainActor.run {
                    self?.messages.append(contentsOf: updatedMessages)
                }
            }
        }
    }
    
    func sendMessage () {
        service.sendMessage(messageText)
    }
}
