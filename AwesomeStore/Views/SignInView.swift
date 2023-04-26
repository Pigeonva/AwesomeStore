//
//  ContentView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 25.04.2023.
//

import SwiftUI

struct SignInView: View {
    
 @State private var viewModel = SignInViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background")
                VStack(spacing: 30) {
                    Text("Sign in")
                        .font(.custom("Montserrat-semibold", size: 30))
                        .padding(.bottom, 50)
                    TextField("Full name", text: $viewModel.user.fullName)
                        .font(.custom("Montserrat", size: 12))
                        .multilineTextAlignment(.center)
                        .frame(width: 289, height: 29)
                        .background(Color("TextField"))
                        .clipShape(Capsule())
                        .frame(width: 289, height: 29)
                    TextField("Email", text: $viewModel.user.email)
                        .font(.custom("Montserrat", size: 12))
                        .multilineTextAlignment(.center)
                        .frame(width: 289, height: 29)
                        .background(Color("TextField"))
                        .clipShape(Capsule())
                        .frame(width: 289, height: 29)
                    SecureField("Password", text: $viewModel.user.password)
                        .font(.custom("Montserrat", size: 12))
                        .multilineTextAlignment(.center)
                        .frame(width: 289, height: 29)
                        .background(Color("TextField"))
                        .clipShape(Capsule())
                        .frame(width: 289, height: 29)
                    NavigationLink(isActive: $viewModel.isPesentContent, destination: {
                        ContentView(viewModel: ContentViewViewModel(user: viewModel.user, isPesentContent: $viewModel.isPesentContent))
                    }, label: {
                        Text("Sign in")
                            .font(.custom("Montserrat", size: 15))
                            .frame(width: 289, height: 46, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color("Button"))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    })
                    HStack(spacing: 10) {
                        Text("Already have an account?")
                            .font(.custom("Montserrat", size: 12))
                        NavigationLink(destination: LogInView(viewModel: LogInViewViewModel(user: viewModel.user, users: viewModel.users, isPresentContent: $viewModel.isPesentContent))) {
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
}
    struct SignInView_Previews: PreviewProvider {
        static var previews: some View {
            SignInView()
        }
}
