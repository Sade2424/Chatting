//
//  ChatMessageCell.swift
//  Chatting
//
//  Created by Sade El Moudden on 16.04.2026.
//

import SwiftUI

struct ChatMessageCell: View {
    let isFromCurrentUser: Bool
    var body: some View {
        HStack {
            if isFromCurrentUser{
                Spacer()
                Text("This is a test message for now that is longer to see what happens")
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemBlue))
                    .foregroundStyle(Color.white)
                    .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser ))
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.5, alignment: .trailing) //so it doesn't go to far when you write a longer message (so it's prettier)
                
            }else{
                HStack(alignment: .bottom, spacing:8){
                    CircularProfileImageView(user:User.MOCK_USER,size: .xxSmall)
                    
                    Text("This is a test message for now that is longer to see what happens")
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray5))
                        .foregroundStyle(Color.black)
                        .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser ))
                        .frame(maxWidth: UIScreen.main.bounds.width / 1.75 , alignment: .trailing)
                    
                    Spacer()
                    
                }
            }
        }
        .padding(.horizontal,8)
    }
}

#Preview {
    ChatMessageCell(isFromCurrentUser: false)
}
