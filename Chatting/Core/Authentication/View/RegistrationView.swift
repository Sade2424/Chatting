//
//  RegistrationView.swift
//  Chatting
//
//  Created by Sade El Moudden on 15.04.2026.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email=""
    @State private var password=""
    @State private var fullname = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Spacer()
            //Logo image
            Image ("chat-app-icon")
                .resizable()
                .scaledToFit()
                .frame (width: 150, height: 150)
                .padding()
            
            //Text field
            
            VStack {
                TextField ("Enter your email", text: $email)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal,24)
                
                TextField ("Enter your fullname", text: $fullname)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal,24)
                
                SecureField ("Enter your password", text: $password)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal,24)
            }
            
            Button {
                print ("Handle login")
            } label: {
                Text("Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(.white))
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
            }
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    
                    Text("Sign In")
                        .fontWeight(.semibold)
                    }
                .font(.footnote)
            }
            .padding(.vertical)
            
        }
    }
}

#Preview {
    RegistrationView()
}
