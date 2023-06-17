//
//  LatestView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 25.04.2023.
//

import SwiftUI

struct LatestView: View {
    
    @ObservedObject var viewModel: ContentViewViewModel
    @Binding var favouriteProducts: [Product] 
    @State var latestProduct = Product()
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: latestProduct.image_url), scale: 1, content: { image in
                image
                    .resizable()
            }, placeholder: {
                Color.blue.opacity(0.5)
            })
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            HStack {
                VStack {
                    Spacer()
                    Text("\(latestProduct.category)")
                        .padding(5)
                        .background(.blue.opacity(0.5))
                        .clipShape(Capsule())
                        .font(.custom("Montserrat-semibold", size: 12))
                    Text("\(latestProduct.name)")
                        .font(.custom("Montserrat-semibold", size: 12))
                    Text("\(String(format: "%.1f", latestProduct.price))$")
                        .font(.custom("Montserrat-semibold", size: 12))
                }
                Spacer()
                VStack {
                    Spacer()
                    HStack(spacing: 5){
                        Button {
                            latestProduct.isLiked?.toggle()
                            if latestProduct.isLiked! && !favouriteProducts.contains(latestProduct) {
                                favouriteProducts.append(latestProduct)
                            }
                        } label: {
                            Image(systemName: latestProduct.isLiked ?? false ? "heart.fill" : "heart")
                                .foregroundColor(Color("TextColor"))
                        }
                        .onChange(of: favouriteProducts) { newValue in
                            var temp = false
                            for value in newValue {
                                if value.name == latestProduct.name {
                                    temp = true
                                }
                            }
                            if !temp {
                                latestProduct.isLiked = false
                            }
                        }
                        .onChange(of: latestProduct.isLiked, perform: { newValue in
                            if !newValue! {
                                favouriteProducts = favouriteProducts.filter { $0.name != latestProduct.name}
                            }
                        })
                        .onAppear {
                            for item in favouriteProducts {
                                if item.name == latestProduct.name {
                                    latestProduct.isLiked = true
                                }
                            }
                        }

                        Button {
                            if !viewModel.cartProducts.contains(latestProduct) {
                                viewModel.cartProducts.append(latestProduct)
                                viewModel.amount += latestProduct.price
                            }
                        } label: {
                            Image(systemName: "plus.circle")
                                .foregroundColor(Color("TextColor"))
                        }
                    }
                }
                
            }
            .padding(.horizontal, 2)
            .padding(.bottom, 10)
        }
    }
}
