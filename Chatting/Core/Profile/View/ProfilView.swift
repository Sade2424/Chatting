//
//  ProfilView.swift
//  Chatting
//
//  Created by Sade El Moudden on 15.04.2026.
//

import SwiftUI
import PhotosUI

struct ProfilView: View {
    
    @StateObject var ViewModel = ProfileViewModel()
    @EnvironmentObject var themeManager: ThemeManager
    
    
    
    let user: User
    
    @State private var selectedAvatar: String
    
    init(user: User) {

            self.user = user

            _selectedAvatar = State(

                initialValue: user.profileImageName ?? "defaultAvatar"

            )

        }
    var body: some View {
        ZStack {
            themeManager.selectedColor
                .ignoresSafeArea()
            
            VStack {
                // header
                VStack {
                    NavigationLink {
                        AvatarSelectionView(selectedAvatar: $selectedAvatar)
                    } label: {
                        Image(selectedAvatar)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    }
                    
                    Text(user.fullname)
                        .font(.title)
                        .fontWeight(.semibold)
                }
                
                // list
                List {
                    Section {
                        ForEach(SettingsOptionsViewModel.allCases) { option in
                            
                            if option == .interfaceColor {
                                NavigationLink {
                                    InterfaceColorView()
                                } label: {
                                    HStack {
                                        Image(systemName: option.imageName)
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                            .foregroundStyle(themeManager.selectedColor)
                                        
                                        Text(option.title)
                                            .font(.subheadline)
                                    }
                                }
                            } else {
                                HStack {
                                    Image(systemName: option.imageName)
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .foregroundStyle(option.imageBackgroundColor)
                                    
                                    Text(option.title)
                                        .font(.subheadline)
                                }
                            }
                        }                }
                    
                    Section {
                        Button("Logout") {
                            AuthService.shared.signOut()
                        }
                        
                        Button("Delete Account") {
                            
                        }
                        
                    }
                    .foregroundStyle(Color(.red))
                }
            }
        }
    }
    
    struct ProfilView_Previews: PreviewProvider {
        static var previews: some View {
            ProfilView(user: User.MOCK_USER)
                .environmentObject(ThemeManager())
        }
    }
}
