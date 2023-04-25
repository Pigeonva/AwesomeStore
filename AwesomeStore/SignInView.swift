//
//  ContentView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 25.04.2023.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
        VStack {
            Text("Sign in")
                .font(.custom("Montserrat", size: 30))
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            SignInView()
        }
    }
}
