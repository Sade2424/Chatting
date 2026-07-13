//
//  LoginView.swift
//  Chatting
//
//  Created by Sade El Moudden on 15.04.2026.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    
    var body: some View {
        NavigationStack {
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
                    TextField ("Enter your email", text: $viewModel.email)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal,24)
                    SecureField ("Enter your password", text: $viewModel.password)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal,24)
                }
                //Forgot password
                
                Button {
                    print ("Forgot password")
                } label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                }
                .frame(maxWidth: .infinity, alignment:.trailing)
                
                //Login button
                
                Button {
                    Task {try await viewModel.login()}
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.white))
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                }
                .padding(.vertical)
                
                //Google login
                
                Button {
                    Task {
                        await viewModel.signInWithGoogle()
                    }
                } label: {
                    HStack {
                        Image("google-logo")
                            .resizable()
                            .frame(width: 20, height: 20)
                        
                        Text("Continue with Google")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(.systemBlue))
                    }
                    .padding(.top, 8)
                }
                
                Spacer()
                
                //sign up link
                
                Divider()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                        }
                    .font(.footnote)
                }
                .padding(.vertical)
                
                }
            }
        }
    }

    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }
