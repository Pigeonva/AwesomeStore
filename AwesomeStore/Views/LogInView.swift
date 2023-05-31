//
//  LogInView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 25.04.2023.
//

import SwiftUI

struct LogInView: View {
    
    @ObservedObject var viewModel: LogInViewViewModel
    @Binding var goToRoot: Bool
    
    var body: some View {
        ZStack {
            Color("Background")
            VStack(spacing: 30) {
                Text("Welcome back")
                    .font(.custom("Montserrat-semibold", size: 30))
                    .padding(.bottom, 50)
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
                Button {
                    //
                } label: {
                    NavigationLink(destination: {
                        ContentView(viewModel: ContentViewViewModel(user: viewModel.user), goToRoot: $goToRoot)
                    }, label: {
                        Text("Log in")
                            .font(.custom("Montserrat", size: 15))
                            .frame(width: 289, height: 46, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color("Button"))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    })
                }


            }
        } .ignoresSafeArea(.all)
            .padding(.bottom, 120)
            .navigationBarBackButtonHidden(true)
    }
}
