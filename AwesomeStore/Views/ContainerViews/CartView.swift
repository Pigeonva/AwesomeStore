//
//  CartView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 26.04.2023.
//

import SwiftUI

struct CartView: View {
    
    @ObservedObject var viewModel: ContentViewViewModel
    @State var showAlertSuccess = false
    @State var showAlertFail = false
    @Binding var amount: Double
    
    var body: some View {
        ZStack {
            Color("Background")
            VStack {
                HStack {
                    Text("Cart")
                        .font(.custom("Montserrat-semibold", size: 30))
                    Spacer()
                    Text("Balance:\(String(format: "%.1f", viewModel.balance))$")
                        .font(.custom("Montserrat", size: 15))
                }
                .padding(.top, 50)
                .padding(.horizontal, 20)
                List {
                    ForEach($viewModel.cartProducts, id: \.self) { $product in
                        CartElementView(viewModel: viewModel, cartProducts: $viewModel.cartProducts, cartProduct: Product(category: product.category, name: product.name, price: product.price, image_url: product.image_url), amount: $amount)
                    }
                    .listRowBackground(
                        RoundedRectangle(cornerRadius: 10)
                            .background(.clear)
                            .foregroundColor(Color("RowBackground"))
                            .padding(
                                EdgeInsets(
                                    top: 5,
                                    leading: 10,
                                    bottom: 5,
                                    trailing: 10
                                )
                            )
                    )
                    .listRowSeparator(.hidden)
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
                        if viewModel.user.balance >= amount {
                            viewModel.balance -= amount
                            amount = 0
                            viewModel.cartProducts.removeAll()
                            showAlertSuccess = true
                        } else {
                            showAlertFail = true
                        }
                    } label: {
                        Text("Purchase")
                            .frame(width: 289)
                            .foregroundColor(.white)
                            .padding()
                            .background(.blue)
                            .cornerRadius(10)
                    }
                    .alert("Thanks!", isPresented: $showAlertSuccess) {
                        Button("OK", role: .cancel) {}
                    }
                    .alert("You don't have enough money!", isPresented: $showAlertFail) {
                        Button("OK", role: .cancel) {}
                    }
                }
                .padding(.bottom, 100)
            }
        }
        .ignoresSafeArea()
    }
}

