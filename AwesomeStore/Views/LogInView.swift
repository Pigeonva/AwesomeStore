//
//  LogInView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 25.04.2023.
//

import SwiftUI

struct LogInView: View {
    @State var firstName = ""
    @State var password = ""
    
    var body: some View {
        ZStack {
            Color("Background")
            VStack(spacing: 30) {
                Text("Welcome back")
                    .font(.custom("Montserrat-semibold", size: 30))
                    .padding(.bottom, 50)
                TextField("First name", text: $firstName)
                    .font(.custom("Montserrat", size: 12))
                    .multilineTextAlignment(.center)
                    .frame(width: 289, height: 29)
                    .background(Color("TextField"))
                    .clipShape(Capsule())
                    .frame(width: 289, height: 29)
                SecureField("Password", text: $password)
                    .font(.custom("Montserrat", size: 12))
                    .multilineTextAlignment(.center)
                    .frame(width: 289, height: 29)
                    .background(Color("TextField"))
                    .clipShape(Capsule())
                    .frame(width: 289, height: 29)
                Button {
                    //
                } label: {
                    Text("Log in")
                        .font(.custom("Montserrat", size: 15))
                        .frame(width: 289, height: 46, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color("Button"))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
            }
        } .ignoresSafeArea(.all)
            .padding(.bottom, 120)
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
