//
//  InboxView.swift
//  Chatting
//
//  Created by Sade El Moudden on 15.04.2026.
//

import SwiftUI

struct InboxView: View {
    @State private var showNewMessageView = false
    var body: some View {
        NavigationStack {
            ScrollView {
                ActiveNowView()
                
                List {
                    ForEach(0...10, id: \.self) {message in
                        InboxRowView()
                        
                    }
                }
                .listStyle(PlainListStyle())
                .frame(height: UIScreen.main.bounds.height - 120)
            }
            .fullScreenCover(isPresented: $showNewMessageView, content: {
               NewMessageView()
                
            })
            .navigationTitle("Chats")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Image(systemName: "person.circle.fill")
                        
                       
                        
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showNewMessageView.toggle()
                    }label: {
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

    
