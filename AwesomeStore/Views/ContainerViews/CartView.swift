//
//  CartView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 26.04.2023.
//

import SwiftUI

struct CartView: View {
    
    @ObservedObject var viewModel: ContentViewViewModel
    
    var body: some View {
        ZStack {
            Color("Background")
            VStack {
                Text("Cart")
                    .font(.custom("Montserrat-semibold", size: 30))
                    .padding(.top, 50)
                ScrollView {
                    CartElementView()
                    Spacer()
                }
            }
            VStack {
                Spacer()
                VStack {
                    Spacer()
                    HStack {
                        Text("Amount")
                            .font(.custom("Montserrat-semibold", size: 20))
                        Spacer()
                        Text("2000$")
                            .font(.custom("Montserrat-semibold", size: 20))
                    }
                    .padding(.horizontal, 50)
                    Button {
                        //
                    } label: {
                        Text("Purchase")
                            .frame(width: 289)
                            .foregroundColor(.white)
                            .padding()
                            .background(.blue)
                            .cornerRadius(10)
                    }
                }
                .padding(.bottom, 100)
            }
        }
        .ignoresSafeArea()
    }
}

