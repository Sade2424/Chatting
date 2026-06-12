//
//  ChatView.swift
//  Chatting
//
//  Created by Sade El Moudden on 16.04.2026.
//

import SwiftUI

struct ChatView: View {
    @StateObject var viewModel: ChatViewModel
    let user: User
    
    init(user: User) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: ChatViewModel (user: user))
    }
    var body: some View {
        VStack {
            ScrollView{
                // header
                VStack {
                    CircularProfileImageView(user: user, size: .xLarge)
                    
                    VStack (spacing:4){
                        Text(user.fullname)
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("ChatApp")
                            .font(.footnote)
                            .foregroundStyle(Color(.gray))
                    }
                    
                }
                
                // messages
                
                LazyVStack{
                    ForEach(viewModel.messages) {message in
                        ChatMessageCell(message: message)
                    }
                }
            }
            
            // message input view
            
            Spacer()
            
            ZStack(alignment:.trailing) {
                TextField ("Message...", text: $viewModel.messageText, axis: .vertical) //Revient à la ligne --> not one long message on the same line
                    .padding(12)
                    .padding(.trailing, 48) // So it doesn't go into the "Send" button
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                
                Button {
                    viewModel.sendMessage()
                    viewModel.messageText = ""
                } label: {
                    Text("Send")
                        .fontWeight(.semibold)
                    
                }
                .padding(.horizontal)
                
                
            }
            .padding()
        }
        .navigationTitle(user.fullname)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ChatView(user: User.MOCK_USER)
}

