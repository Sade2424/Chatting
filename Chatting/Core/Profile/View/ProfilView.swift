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
    let user: User
    var body: some View {
        VStack{
            //header
            VStack {
                PhotosPicker(selection: $ViewModel.selectedItem) {
                    if let profileImage = ViewModel.profileImage {
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .frame(width:80, height:80)
                            .clipShape(Circle())
                    }else {
                        CircularProfileImageView(user: user, size: .xLarge)
                    }
                }
                
                Text(user.fullname)
                    .font(.title)
                    .fontWeight(.semibold)
            }
            //list
            
            List {
                Section {
                    ForEach(SettingsOptionsViewModel.allCases) { option in
                        HStack {
                            Image(systemName: option.imageName)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundStyle(option.imageBackgroundColor)
                            
                            Text(option.title)
                                .font(.subheadline)
                        }
                        
                    }
                    
                }
                Section {
                    Button("Logout") {
                    }
                    Button("Delete Account"){
                        
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
    }
}
