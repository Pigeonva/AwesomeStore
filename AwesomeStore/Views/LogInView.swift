//
//  LogInView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 25.04.2023.
//

import SwiftUI

struct LogInView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var viewModel: LogInViewViewModel
    
    var body: some View {
        ZStack {
            Color("Background")
            VStack(spacing: 30) {
                Text("Welcome back")
                    .font(.custom("Montserrat-semibold", size: 30))
                    .padding(.bottom, 50)
                TextField("", text: $viewModel.email)
                    .font(.custom("Montserrat", size: 15))
                    .placeholder(when: viewModel.email.isEmpty, placeholder: {
                        Text("Email")
                            .foregroundColor(.gray)
                            .font(.custom("Montserrat", size: 15))
                    })
                    .multilineTextAlignment(.center)
                    .keyboardType(.URL)
                    .frame(width: 289, height: 44)
                    .background(Color("TextField"))
                    .clipShape(Capsule())
                    .textInputAutocapitalization(.never)
                SecureField("", text: $viewModel.password)
                    .font(.custom("Montserrat", size: 15))
                    .placeholder(when: viewModel.email.isEmpty, placeholder: {
                        Text("Password")
                            .foregroundColor(.gray)
                            .font(.custom("Montserrat", size: 15))
                    })
                    .multilineTextAlignment(.center)
                    .frame(width: 289, height: 44)
                    .background(Color("TextField"))
                    .clipShape(Capsule())
                Text(viewModel.errorMessage)
                    .font(.custom("Montserrat-semibold", size: 12))
                    .frame(width: 289, height: 29)
                    .foregroundColor(.red)
                    .padding(.top, -25)
                Button {
                    viewModel.getErrorMessage()
                } label: {
                    NavigationLink(destination: {
                        ContentView(viewModel: ContentViewViewModel(user: $viewModel.user, goToRoot: $viewModel.goToRoot))
                    }, label: {
                        Text("Log in")
                            .font(.custom("Montserrat", size: 15))
                            .frame(width: 289, height: 46, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color("Button"))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    })
                    .disabled(!viewModel.isUserExist)
                }
            }
        }
        .ignoresSafeArea(.all)
        .padding(.bottom, 120)
        .background(Color("Background"))
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(Color("TextColor"))
                        Text("Back")
                            .font(.custom("Montserrat", size: 20))
                            .foregroundColor(Color("TextColor"))
                    }
                }
            }
        }
    }
}
