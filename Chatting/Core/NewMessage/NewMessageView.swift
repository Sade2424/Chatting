//
//  NewMessageView.swift
//  Chatting
//
//  Created by Sade El Moudden on 15.04.2026.
//

import SwiftUI

struct NewMessageView: View{
    @State private var searchText = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            ScrollView{
                TextField("To: ", text: $searchText)
                    .frame(height:44)
                    .padding(.leading)
                    .background(Color(.systemGroupedBackground))
                
                Text("CONTACTS")
                    .foregroundStyle(Color(.gray))
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            
                ForEach(0...10, id: \.self) { user in
                    VStack {
                        HStack {
                            CircularProfileImageView(user: User.MOCK_USER, size: .small)
                            Text("Soka")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Spacer()
                        }
                        .padding(.leading)
                        
                        Divider()
                            .padding(.leading, 40)
                    }
                    
                    
                    
                }
            }
            .navigationTitle("New Message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                        
                    }
                    .foregroundStyle(Color(.black))
                }
            }
        }
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NewMessageView()
        }
    }
}
