//
//  CartElementView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 26.04.2023.
//

import SwiftUI

struct CartElementView: View {
    
    @ObservedObject var viewModel: ContentViewViewModel
    @Binding var cartProducts: [Product]
    @State var cartProduct = Product()
    @Binding var amount: Double
    @State var quantity = 1.0
    
    var body: some View {
        HStack(spacing: 15) {
            VStack {
                Spacer()
                Text(cartProduct.name)
                    .font(.custom("Montserrat-semibold", size: 20))
                Spacer()
                AsyncImage(url: URL(string: cartProduct.image_url), scale: 1, content: { image in
                    image
                        .resizable()
                }, placeholder: {
                    Color.blue.opacity(0.5)
                })
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                Spacer()
            }
            VStack {
                HStack {
                    
                    Spacer()
                    Button {
                        cartProducts = cartProducts.filter { $0.name != cartProduct.name}
                        amount -= quantity * cartProduct.price
                        quantity = 1
                    } label: {
                        Image(systemName: "x.circle")
                            .foregroundColor(Color("TextColor"))
                            .font(.title)
                    }
                    .padding(.top, 20)
                    .buttonStyle(BorderlessButtonStyle())
                }
                Spacer()
                Text("\(String(format: "%.1f", cartProduct.price * quantity))$")
                    .font(.custom("Montserrat-semibold", size: 15))
                Spacer()
                Text("\(String(format: "%.0f", quantity))")
                    .font(.custom("Montserrat-semibold", size: 15))
                HStack(spacing: 5) {
                    Spacer()
                    Button {
                        quantity -= 1
                        if quantity == 0 {
                            cartProducts = cartProducts.filter { $0.name != cartProduct.name}
                            quantity = 1
                        }
                        amount -= cartProduct.price
                    } label: {
                        Text("-")
                            .frame(width: 30, height: 20)
                            .padding(3)
                            .background(.blue.opacity(0.5))
                            .clipShape(Capsule())
                            .foregroundColor(Color("TextColor"))
                            .font(.title)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    Button {
                        quantity += 1
                        amount += cartProduct.price
                    } label: {
                        Text("+")
                            .frame(width: 30, height: 20)
                            .padding(3)
                            .background(.blue.opacity(0.5))
                            .clipShape(Capsule())
                            .foregroundColor(Color("TextColor"))
                            .font(.title)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    
                }
            }
        }
        .padding(.horizontal, 20)
    }
}


