//
//  InboxRowView.swift
//  Chatting
//
//  Created by Sade El Moudden on 15.04.2026.
//

import SwiftUI

struct InboxRowView: View {
    let message: Message
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            CircularProfileImageView(user: message.user, size: .medium)
            
            VStack(alignment: .leading, spacing: 4){
                Text(message.user?.fullname ?? "")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(message.messageText)
                    .font(.subheadline)
                    .foregroundStyle(Color(.gray))
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading) // remplace UIScreen (too old like usual)
            }
            
            HStack {
                Text(message.timestampString)
                
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundStyle(Color(.gray))
        }
        .frame(height: 72)
    }
}

//struct InboxRowView_Previews: PreviewProvider {
//    static var previews: some View {
    //    InboxRowView()
 //   }
//}
