//
//  CartView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 26.04.2023.
//

import SwiftUI

struct CartView: View {
    
    @ObservedObject var viewModel: ContentViewViewModel
    @State var amount = 0.0
    
    var body: some View {
        ZStack {
            Color("Background")
            VStack {
                Text("Cart")
                    .font(.custom("Montserrat-semibold", size: 30))
                    .padding(.top, 50)
                List {
                    ForEach($viewModel.cartProducts, id: \.self) { $product in
                        CartElementView(viewModel: viewModel, cartProducts: $viewModel.cartProducts, cartProduct: Product(category: product.category, name: product.name, price: product.price, image_url: product.image_url), amount: $amount)
                    }
                }
                Spacer(minLength: 200)
            }
            VStack {
                Spacer()
                VStack {
                    Spacer()
                    HStack {
                        Text("Amount")
                            .font(.custom("Montserrat-semibold", size: 20))
                        Spacer()
                        Text("\(String(format: "%.1f", amount))$")
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

