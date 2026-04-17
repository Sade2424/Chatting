//
//  InboxView.swift
//  Chatting
//
//  Created by Sade El Moudden on 15.04.2026.
//

import SwiftUI

struct InboxView: View {
    @State private var showNewMessageView = false
    @State private var user = User.MOCK_USER
    
    var body: some View {
        NavigationStack {
            List {
                
                // Section "Active now"
                ActiveNowView()
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                
                // Messages
                ForEach(0...10, id: \.self) { message in
                    InboxRowView()
                }
            }
            .listStyle(.plain)
            
            .navigationDestination(for: User.self) { user in
                ProfilView(user: user)
            }
            
            .fullScreenCover(isPresented: $showNewMessageView) {
                NewMessageView()
            }
            
            .navigationTitle("Chats")
            
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(value: user) {
                        CircularProfileImageView(user: user, size: .xSmall)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showNewMessageView.toggle()
                    } label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(.black, Color(.systemGray5))
                    }
                }
            }
        }
    }
}

struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        InboxView()
    }
}

// had to change the old version since putting a List in a Scrollview causes problems. To make it short, a the list does the scrolling and the Scrollview also does scrolling. Which implies that there are two scrolling --> some small bugs when you scroll. To resolve this issues i removed the Scrollview and put it in a List only. And voila! no bugs!
