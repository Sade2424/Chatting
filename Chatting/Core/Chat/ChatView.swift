//
//  ChatView.swift
//  Chatting
//
//  Created by Sade El Moudden on 16.04.2026.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    var body: some View {
        VStack {
            ScrollView{
                // header
                VStack {
                    CircularProfileImageView(user: User.MOCK_USER, size: .xLarge)
                    
                    VStack (spacing:4){
                        Text("Markus Poulpous")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("ChatApp")
                            .font(.footnote)
                            .foregroundStyle(Color(.gray))
                    }
                    
                }
                
                // messages
                
                ForEach(0...15, id:\.self) {message in
                    ChatMessageCell(isFromCurrentUser: Bool.random())
                }
                
               
                
               
            }
            
            // message input view
            
            Spacer()
            
            ZStack(alignment:.trailing) {
                TextField ("Message...", text: $messageText, axis: .vertical) //Revient à la ligne --> not one long message on the same line
                    .padding(12)
                    .padding(.trailing, 48) // So it doesn't go into the "Send" button
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                
                Button {
                    print ("Send message")
                } label: {
                    Text("Send")
                        .fontWeight(.semibold)
                    
                }
                .padding(.horizontal)
                
                
            }
            .padding()
        }
    }
}

#Preview {
    ChatView()
}

