//
//  ContentView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 25.04.2023.
//

import SwiftUI

struct SignInView: View {
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    
    var body: some View {
        ZStack {
            Color("Background")
            VStack(spacing: 30) {
                Text("Sign in")
                    .font(.custom("Montserrat-semibold", size: 30))
                    .padding(.bottom, 50)
                TextField("First name", text: $firstName)
                    .font(.custom("Montserrat", size: 12))
                    .multilineTextAlignment(.center)
                    .frame(width: 289, height: 29)
                    .background(Color("TextField"))
                    .clipShape(Capsule())
                    .frame(width: 289, height: 29)
                TextField("Last name", text: $lastName)
                    .font(.custom("Montserrat", size: 12))
                    .multilineTextAlignment(.center)
                    .frame(width: 289, height: 29)
                    .background(Color("TextField"))
                    .clipShape(Capsule())
                    .frame(width: 289, height: 29)
                TextField("Email", text: $email)
                    .font(.custom("Montserrat", size: 12))
                    .multilineTextAlignment(.center)
                    .frame(width: 289, height: 29)
                    .background(Color("TextField"))
                    .clipShape(Capsule())
                    .frame(width: 289, height: 29)
                Button {
                    //
                } label: {
                    Text("Sign in")
                        .font(.custom("Montserrat", size: 15))
                        .frame(width: 289, height: 46, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color("Button"))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                HStack(spacing: 10) {
                    Text("Already have an account?")
                        .font(.custom("Montserrat", size: 12))
                    Button {
                        //
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
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            SignInView()
        }
}
