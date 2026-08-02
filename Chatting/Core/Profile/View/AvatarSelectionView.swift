//
//  AvatarSelectionView.swift
//  Chatting
//
//  Created by Sade El Moudden on 01.08.2026.
//

import Foundation
import SwiftUI

struct AvatarSelectionView: View {

    @EnvironmentObject var themeManager: ThemeManager
    @Binding var selectedAvatar: String

    let avatars = [
        "Peach",
        "Bowser",
        "Mario",
        "Luigi",
        "Toad",
        "Toadette",
        "Daisy",
        "Yoshi"
    ]

    var body: some View {
        VStack {
            Text("Choose your avatar")
                .font(.title)

            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: 80))
            ]) {
                ForEach(avatars, id: \.self) { avatar in
                    
                    Image(avatar)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .onTapGesture {
                            selectedAvatar = avatar
                            
                            Task {
                                do {
                                    try await UserService.shared.updateProfileImage(avatar)
                                    print("DEBUG: Avatar updated to \(avatar)")
                                } catch {
                                    print("DEBUG: Failed updating avatar: \(error)")
                                }
                            }
                        }
                }
            }
        }
    }
}
