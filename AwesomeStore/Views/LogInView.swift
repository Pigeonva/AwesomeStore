//
//  LogInView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 25.04.2023.
//

import SwiftUI

struct LogInView: View {
    
    @StateObject var viewModel = LogInViewViewModel()
    @Binding var goToRoot: Bool
    
    var body: some View {
        ZStack {
            Color("Background")
            VStack(spacing: 30) {
                Text("Welcome back")
                    .font(.custom("Montserrat-semibold", size: 30))
                    .padding(.bottom, 50)
                TextField("Email", text: $viewModel.email)
                    .font(.custom("Montserrat", size: 12))
                    .multilineTextAlignment(.center)
                    .frame(width: 289, height: 29)
                    .background(Color("TextField"))
                    .clipShape(Capsule())
                    .frame(width: 289, height: 29)
                SecureField("Password", text: $viewModel.password)
                    .font(.custom("Montserrat", size: 12))
                    .multilineTextAlignment(.center)
                    .frame(width: 289, height: 29)
                    .background(Color("TextField"))
                    .clipShape(Capsule())
                    .frame(width: 289, height: 29)
                Text(viewModel.errorMessage)
                    .font(.custom("Montserrat-semibold", size: 12))
                    .frame(width: 289, height: 29)
                    .foregroundColor(.red)
                    .padding(.top, -25)
                Button {
                    viewModel.getErrorMessage()
                } label: {
                    NavigationLink(destination: {
                        ContentView(viewModel: ContentViewViewModel(user: $viewModel.user, goToRoot: $goToRoot, currentView: EmptyView()))
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
        } .ignoresSafeArea(.all)
            .padding(.bottom, 120)
            .background(Color("Background"))
            .navigationBarBackButtonHidden(true)
    }
}
