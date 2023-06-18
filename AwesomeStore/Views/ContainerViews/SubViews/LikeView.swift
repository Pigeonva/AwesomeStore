//
//  LikeView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 25.04.2023.
//

import SwiftUI

struct LikeView: View {
    
    @ObservedObject var viewModel: ContentViewViewModel
    @State var favoriteProduct = Product()
    
    var body: some View {
        HStack(spacing: 15) {
            VStack {
                AsyncImage(url: URL(string: favoriteProduct.image_url), scale: 1, content: { image in
                    image
                        .resizable()
                }, placeholder: {
                    Color.blue.opacity(0.5)
                })
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                Text(favoriteProduct.name)
                    .font(.custom("Montserrat", size: 15))
                Text("\(String(format: "%.1f", favoriteProduct.price))$")
                    .font(.custom("Montserrat", size: 15))
                    .padding(.top, 5)
            }
            Spacer()
            HStack{
                Spacer()
            VStack {
                Button {
                    viewModel.favouriteProducts = viewModel.favouriteProducts.filter { $0.name != favoriteProduct.name}
                } label: {
                    Image(systemName: "x.square")
                        .foregroundColor(Color("TextColor"))
                        .font(.largeTitle)
                }
                .buttonStyle(BorderlessButtonStyle())
                Spacer()
                Button {
                    if !viewModel.cartProducts.contains(favoriteProduct) {
                        viewModel.cartProducts.append(favoriteProduct)
                        viewModel.amount += favoriteProduct.price
                    }
                } label: {
                    Image(systemName: "plus.circle")
                        .foregroundColor(Color("TextColor"))
                        .font(.largeTitle)
                }
                .buttonStyle(BorderlessButtonStyle())
                Spacer()
            }}
        }
        .padding(.horizontal, 20)
    }
}

