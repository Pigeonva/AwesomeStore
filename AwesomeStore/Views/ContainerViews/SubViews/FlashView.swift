//
//  FlashView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 25.04.2023.
//

import SwiftUI

struct FlashView: View {
    
    @ObservedObject var viewModel: ContentViewViewModel
    @Binding var favouriteProducts: [Product]
    @State var flashProduct = Product()
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: flashProduct.image_url), scale: 1, content: { image in
                image
                    .resizable()
                    .cornerRadius(10)
            }, placeholder: {
                Color.blue.opacity(0.5)
            })
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            VStack {
                Text("\(flashProduct.category)")
                    .padding(5)
                    .background(.blue.opacity(0.5))
                    .clipShape(Capsule())
                    .font(.custom("Montserrat-semibold", size: 12))
                Text("\(flashProduct.name)")
                    .font(.custom("Montserrat-semibold", size: 12))
                Text("\(String(format: "%.1f", flashProduct.price))$")
                    .font(.custom("Montserrat-semibold", size: 12))
            }
            HStack {
                Text("-\(flashProduct.discount ?? 0)%")
                    .padding(5)
                    .background(.red.opacity(0.5))
                    .clipShape(Capsule())
                    .font(.custom("Montserrat-semibold", size: 12))
                Spacer()
                VStack {
                    Spacer()
                    HStack(spacing: 10) {
                        Button {
                            flashProduct.isLiked?.toggle()
                            if flashProduct.isLiked! && !favouriteProducts.contains(flashProduct) {
                                favouriteProducts.append(flashProduct)
                            }
                        } label: {
                            Image(systemName: flashProduct.isLiked! ? "heart.fill" : "heart")
                                .foregroundColor(Color("TextColor"))
                        }
                        
                        .onChange(of: favouriteProducts) { newValue in
                            var temp = false
                            for value in newValue {
                                if value.name == flashProduct.name {
                                    temp = true
                                }
                            }
                            if !temp {
                                flashProduct.isLiked = false
                            }
                        }
                        .onChange(of: flashProduct.isLiked, perform: { newValue in
                            if !newValue! {
                                favouriteProducts = favouriteProducts.filter { $0.name != flashProduct.name}
                            }
                        })
                        .onAppear {
                            for item in favouriteProducts {
                                if item.name == flashProduct.name {
                                    flashProduct.isLiked = true
                                }
                            }
                        }
                        Button {
                            var tempProd = flashProduct
                            tempProd.isLiked = false
                            if !viewModel.cartProducts.contains(tempProd) {
                                viewModel.cartProducts.append(tempProd)
                                viewModel.amount += tempProd.price
                            }
                        } label: {
                            Image(systemName: "plus.circle")
                                .foregroundColor(Color("TextColor"))
                        }
                    }
                }}
        }
        .padding(.horizontal, 20)
    }
}


