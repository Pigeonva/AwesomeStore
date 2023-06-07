//
//  ContentView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 25.04.2023.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject var viewModel = SignInViewModel()
    
    var body: some View {
        ZStack {
            Color("Background")
            VStack(spacing: 30) {
                Section {
                    Text("Sign in")
                        .font(.custom("Montserrat-semibold", size: 30))
                        .padding(.bottom, 50)
                    TextField("", text: $viewModel.fullName)
                        .font(.custom("Montserrat", size: 15))
                        .placeholder(when: viewModel.fullName.isEmpty, placeholder: {
                            Text("Full name")
                                .foregroundColor(.gray)
                                .font(.custom("Montserrat", size: 15))
                        })
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .frame(width: 289, height: 44)
                        .background(Color("TextField"))
                        .clipShape(Capsule())
                        .autocorrectionDisabled()
                        .onDisappear { viewModel.fullName = "" }
                    Text(viewModel.nameMessage)
                        .font(.custom("Montserrat-semibold", size: 12))
                        .frame(width: 289, height: 20)
                        .foregroundColor(.red)
                        .padding(.top, -25)
                    TextField("", text: $viewModel.email)
                        .font(.custom("Montserrat", size: 15))
                        .placeholder(when: viewModel.email.isEmpty, placeholder: {
                            Text("Email")
                                .foregroundColor(.gray)
                                .font(.custom("Montserrat", size: 15))
                        })
                        .multilineTextAlignment(.center)
                        .frame(width: 289, height: 44)
                        .keyboardType(.URL)
                        .background(Color("TextField"))
                        .clipShape(Capsule())
                        .padding(.top, -25)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .onDisappear { viewModel.email = "" }
                    ZStack {
                        Text(viewModel.userMessage)
                            .font(.custom("Montserrat-semibold", size: 12))
                            .frame(width: 289, height: 20)
                            .foregroundColor(.red)
                            .padding(.top, -25)
                        Text(viewModel.emailMessage)
                            .font(.custom("Montserrat-semibold", size: 12))
                            .frame(width: 289, height: 20)
                            .foregroundColor(.red)
                            .padding(.top, -25)
                    }
                    SecureField("", text: $viewModel.password)
                        .font(.custom("Montserrat", size: 15))
                        .placeholder(when: viewModel.password.isEmpty, placeholder: {
                            Text("Password")
                                .foregroundColor(.gray)
                                .font(.custom("Montserrat", size: 15))
                        })
                        .multilineTextAlignment(.center)
                        .frame(width: 289, height: 44)
                        .background(Color("TextField"))
                        .clipShape(Capsule())
                        .padding(.top, -25)
                        .onDisappear { viewModel.password = "" }
                    Text(viewModel.passwordMessage)
                        .font(.custom("Montserrat-semibold", size: 12))
                        .frame(width: 289, height: 20)
                        .foregroundColor(.red)
                        .padding(.top, -25)
                }
                Button {
                    viewModel.getErrorMessages()
                } label: {
                    NavigationLink(isActive: $viewModel.goToRootTwo) {
                        ContentView(viewModel: ContentViewViewModel(user: $viewModel.user,
                                                                    goToRoot: $viewModel.goToRootTwo,
                                                                    currentView: EmptyView()))
                    } label: {
                        Text("Sign in")
                            .font(.custom("Montserrat", size: 15))
                            .frame(width: 289, height: 46, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color("Button"))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                    .simultaneousGesture(TapGesture().onEnded({ _ in
                        viewModel.createUser()
                    }))
                    .disabled(!viewModel.isValid)
                }
                
                HStack(spacing: 10) {
                    Text("Already have an account?")
                        .font(.custom("Montserrat", size: 12))
                    NavigationLink(isActive: $viewModel.goToRoot) {
                        LogInView(viewModel: LogInViewViewModel(goToRoot: $viewModel.goToRoot))
                    } label: {
                        Text("Log in")
                            .font(.custom("Montserrat", size: 12))
                    }
                }
                VStack(spacing: 20) {
                    Button {
                        //
                    } label: {
                        HStack {
                            Image("Google")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                        Text("Sign in with Google")
                            .font(.custom("Montserrat", size: 15))
                            .foregroundColor(Color("TextColor"))
                    }
                    Button {
                        //
                    } label: {
                        HStack {
                            Image("Apple")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                        Text("Sign in with Apple")
                            .font(.custom("Montserrat", size: 15))
                            .foregroundColor(Color("TextColor"))
                    }
                } .padding(.top, 50)
                
                
            }
        } .ignoresSafeArea(.all)
        
    }
}

