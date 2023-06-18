//
//  ProductView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 11.06.2023.
//

import SwiftUI

struct ProductView: View {
    
    @ObservedObject var viewModel: ContentViewViewModel
    @Binding var favouriteProducts: [Product]
    @State var product = Product()
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: product.image_url), scale: 1, content: { image in
                image
                    .resizable()
            }, placeholder: {
                Color.blue.opacity(0.5)
            })
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Text("\(product.name)")
                        .font(.custom("Montserrat-semibold", size: 12))
                        .foregroundColor(Color("TextColor"))
                    Text("\(String(format: "%.1f", product.price))$")
                        .font(.custom("Montserrat-semibold", size: 12))
                        .foregroundColor(Color("TextColor"))
                }
                Spacer()
                VStack {
                    Spacer()
                    HStack{
                        Button {
                            product.isLiked?.toggle()
                            if product.isLiked! && !favouriteProducts.contains(product) {
                                favouriteProducts.append(product)
                            }
                        } label: {
                            Image(systemName: product.isLiked ?? false ? "heart.fill" : "heart")
                                .foregroundColor(Color("TextColor"))
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        .onChange(of: favouriteProducts) { newValue in
                            var temp = false
                            for value in newValue {
                                if value.name == product.name {
                                    temp = true
                                }
                            }
                            if !temp {
                                product.isLiked = false
                            }
                        }
                        .onChange(of: product.isLiked, perform: { newValue in
                            if !newValue! {
                                favouriteProducts = favouriteProducts.filter { $0.name != product.name}
                            }
                        })
                        .onAppear {
                            for item in favouriteProducts {
                                if item.name == product.name {
                                    product.isLiked = true
                                }
                            }
                        }
                        Button {
                            if !viewModel.cartProducts.contains(product) {
                                viewModel.cartProducts.append(product)
                            }
                        } label: {
                            Image(systemName: "plus.circle")
                                .foregroundColor(Color("TextColor"))
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
                
            }
            .padding(.horizontal, 2)
            .padding(.bottom, 10)
        }
    }
}
