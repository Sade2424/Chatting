//
//  NewMessageView.swift
//  Chatting
//
//  Created by Sade El Moudden on 15.04.2026.
//

import SwiftUI

struct NewMessageView: View {
    @EnvironmentObject var themeManager: ThemeManager
    @State private var searchText = ""
    @StateObject private var viewModel = NewMessageViewModel()
    @Binding var selectedUser: User?
    @Environment(\.dismiss) var dismiss

    private var filteredUsers: [User] {
        if searchText.isEmpty {
            return viewModel.users
        } else {
            return viewModel.users.filter {
                $0.fullname.localizedCaseInsensitiveContains(searchText) // localizedCaseInsensitiveContains: is used so Sade = sade -> doesnt care about capital letters
            }
        }
    }
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.gray)

                    TextField("Search...", text: $searchText)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)

                Text("CONTACTS")
                    .foregroundStyle(Color(.gray))
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()

                ForEach(filteredUsers) { user in
                    VStack {
                        HStack {
                            CircularProfileImageView(
                                user: user,
                                size: .small,
                                color: themeManager.selectedColor
                            )

                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)

                            Spacer()
                        }
                        .padding(.leading)

                        Divider()
                            .padding(.leading, 40)
                    }
                    .onTapGesture {
                        selectedUser = user
                        dismiss()
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
