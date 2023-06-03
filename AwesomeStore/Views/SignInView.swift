//
//  ContentView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 25.04.2023.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel: SignInViewModel
    
    
    
    init(viewModel: SignInViewModel) {
        self.viewModel = viewModel
    }
    
    
    var body: some View {
            ZStack {
                Color("Background")
                VStack(spacing: 30) {
                    Section {
                        Text("Sign in")
                            .font(.custom("Montserrat-semibold", size: 30))
                            .padding(.bottom, 50)
                        TextField("Full name", text: $viewModel.fullName)
                            .font(.custom("Montserrat", size: 12))
                            .multilineTextAlignment(.center)
                            .frame(width: 289, height: 29)
                            .background(Color("TextField"))
                            .clipShape(Capsule())
                            .frame(width: 289, height: 29)
                            .autocorrectionDisabled()
                            .onDisappear {
                                viewModel.fullName = ""
                            }
                        Text(viewModel.nameMessage)
                            .font(.custom("Montserrat-semibold", size: 12))
                            .frame(width: 289, height: 29)
                            .foregroundColor(.red)
                            .padding(.top, -25)
                        TextField("Email", text: $viewModel.email)
                            .font(.custom("Montserrat", size: 12))
                            .multilineTextAlignment(.center)
                            .frame(width: 289, height: 29)
                            .background(Color("TextField"))
                            .clipShape(Capsule())
                            .frame(width: 289, height: 29)
                            .padding(.top, -25)
                            .autocorrectionDisabled()
                            .onDisappear {
                                viewModel.email = ""
                            }
                        Text(viewModel.emailMessage)
                            .font(.custom("Montserrat-semibold", size: 12))
                            .frame(width: 289, height: 29)
                            .foregroundColor(.red)
                            .padding(.top, -25)
                        SecureField("Password", text: $viewModel.password)
                            .font(.custom("Montserrat", size: 12))
                            .multilineTextAlignment(.center)
                            .frame(width: 289, height: 29)
                            .background(Color("TextField"))
                            .clipShape(Capsule())
                            .frame(width: 289, height: 29)
                            .padding(.top, -25)
                            .onDisappear {
                                viewModel.password = ""
                            }
                        Text(viewModel.passwordMessage)
                            .font(.custom("Montserrat-semibold", size: 12))
                            .frame(width: 289, height: 29)
                            .foregroundColor(.red)
                            .padding(.top, -25)
                    }
                    NavigationLink(isActive: $viewModel.goToRootTwo) {
                        ContentView(viewModel: ContentViewViewModel(user: User()), goToRoot: $viewModel.goToRootTwo)
                    } label: {
                        Text("Sign in")
                            .font(.custom("Montserrat", size: 15))
                            .frame(width: 289, height: 46, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color("Button"))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                    .disabled(!viewModel.isValid)
                    
                    HStack(spacing: 10) {
                        Text("Already have an account?")
                            .font(.custom("Montserrat", size: 12))
                        NavigationLink(isActive: $viewModel.goToRoot) {
                            LogInView(viewModel: LogInViewViewModel(), goToRoot: $viewModel.goToRoot)
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
                                .foregroundColor(.black)
                                .font(.custom("Montserrat", size: 15))
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
                                .foregroundColor(.black)
                                .font(.custom("Montserrat", size: 15))
                        }
                    } .padding(.top, 50)
                    
                    
                }
            } .ignoresSafeArea(.all)
            
        }
}

