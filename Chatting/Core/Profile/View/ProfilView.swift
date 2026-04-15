//
//  ProfilView.swift
//  Chatting
//
//  Created by Sade El Moudden on 15.04.2026.
//

import SwiftUI

struct ProfilView: View {
    var body: some View {
        VStack{
            //header
            VStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width:80, height:80)
                    .foregroundStyle(Color(.systemGray4))
                
                Text("Pixel")
                    .font(.title)
                    .fontWeight(.semibold)
            }
            //list
            
            List {
                Section {
                    ForEach(SettingsOptionsViewModel.allCases) { option in
                        HStack {
                            Image(systemName: "bell.circle.fill")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundStyle(Color(.systemPurple))
                            
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
        ProfilView()
    }
}
