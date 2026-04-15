//
//  InboxRowView.swift
//  Chatting
//
//  Created by Sade El Moudden on 15.04.2026.
//

import SwiftUI

struct InboxRowView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 64, height:64)
                .foregroundStyle(Color(.systemGray4))
            
            VStack(alignment: .leading, spacing: 4){
                Text("Loutre")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("Some test message for now that spans more than one line")
                    .font(.subheadline)
                    .foregroundStyle(Color(.gray))
                    .lineLimit(2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
            }
            
            HStack {
                Text("Yesterday")
                
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundStyle(Color(.gray))
        }
      
        .frame(height: 72)

    }
}

struct InboxRowView_Previews: PreviewProvider {
    static var previews: some View {
        InboxRowView()
    }
}
