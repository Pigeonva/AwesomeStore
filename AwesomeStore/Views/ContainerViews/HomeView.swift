//
//  HomeView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 25.04.2023.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: ContentViewViewModel
    
    var body: some View {
        ZStack{
            Color("Background")
            VStack {
                HStack {
                    Text("Awesome store")
                        .font(.custom("Montserrat-semibold", size: 30))
                        .padding(.bottom, 20)
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("\(viewModel.user.fullName)")
                        Picker("Location", selection: $viewModel.cityIndex) {
                            ForEach(0..<viewModel.location.count, id: \.self) { city in
                                Text("\(self.viewModel.location[city])")
                            }
                        }
                        .tint(Color("TextColor"))
                    }
                }
                .padding(.horizontal, 20)
                TextField("", text: $viewModel.searchTextField)
                    .placeholder(when: viewModel.searchTextField.isEmpty, placeholder: {
                        Text("What are you looking for?")
                            .foregroundColor(.gray)
                            .font(.custom("Montserrat", size: 15))
                    })
                    .foregroundColor(.black)
                    .font(.custom("Montserrat", size: 12))
                    .multilineTextAlignment(.center)
                    .frame(width: 289, height: 29)
                    .background(Color("TextField"))
                    .clipShape(Capsule())
                    .frame(width: 289, height: 29)
                HStack {
                    VStack(spacing: 1){
                        Button {
                            if viewModel.visabilityIndex != 2 {
                                viewModel.visabilityIndex = 2
                            } else {
                                viewModel.visabilityIndex = 0
                            }
                        } label: {
                            Image(systemName: "iphone.rear.camera")
                                .padding(10)
                                .font(.largeTitle)
                                .foregroundColor(Color("TextColor"))
                                .background(viewModel.visabilityIndex == 2 ? .blue.opacity(0.3) : .clear)
                                .clipShape(Circle())
                        }
                        Text("Phones")
                            .font(.footnote)
                    }
                    Spacer()
                    VStack(spacing: 1){
                        Button {
                            if viewModel.visabilityIndex != 3 {
                                viewModel.visabilityIndex = 3
                            } else {
                                viewModel.visabilityIndex = 0
                            }
                        } label: {
                            Image(systemName: "gamecontroller")
                                .padding(10)
                                .font(.largeTitle)
                                .foregroundColor(Color("TextColor"))
                                .background(viewModel.visabilityIndex == 3 ? .blue.opacity(0.3) : .clear)
                                .clipShape(Circle())
                        }
                        Text("Games")
                            .font(.footnote)
                    }
                    Spacer()
                    VStack(spacing: 1){
                        Button {
                            if viewModel.visabilityIndex != 4 {
                                viewModel.visabilityIndex = 4
                            } else {
                                viewModel.visabilityIndex = 0
                            }
                        } label: {
                            Image(systemName: "car")
                                .padding(10)
                                .font(.largeTitle)
                                .foregroundColor(Color("TextColor"))
                                .background(viewModel.visabilityIndex == 4 ? .blue.opacity(0.3) : .clear)
                                .clipShape(Circle())
                        }
                        Text("Cars")
                            .font(.footnote)
                    }
                    Spacer()
                    VStack(spacing: 1){
                        Button {
                            if viewModel.visabilityIndex != 5 {
                                viewModel.visabilityIndex = 5
                            } else {
                                viewModel.visabilityIndex = 0
                            }
                        } label: {
                            Image(systemName: "soccerball")
                                .padding(10)
                                .font(.largeTitle)
                                .foregroundColor(Color("TextColor"))
                                .background(viewModel.visabilityIndex == 5 ? .blue.opacity(0.3) : .clear)
                                .clipShape(Circle())
                        }
                        Text("Kids")
                            .font(.footnote)
                    }
                }
                .padding(.horizontal, 50)
                .padding(.top, 20)
                if viewModel.visabilityIndex == 0 {
                    ScrollView{
                        VStack(spacing: 5) {
                            HStack {
                                Text("Latest")
                                    .font(.custom("Montserrat-semibold", size: 20))
                                Spacer()
                            }
                            .padding(.horizontal, 30)
                            .padding(.top, 30)
                            ScrollView(.horizontal) {
                                HStack(spacing: 15) {
                                    ForEach($viewModel.latestProducts, id: \.self) { $product in
                                        LatestView(viewModel: viewModel, favouriteProducts: $viewModel.favouriteProducts, latestProduct: Product(category: product.category, name: product.name, price: product.price, image_url: product.image_url))
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                        
                        VStack(spacing: 5) {
                            HStack {
                                Text("Flash sale")
                                    .font(.custom("Montserrat-semibold", size: 25))
                                Spacer()
                            }
                            .padding(.horizontal, 30)
                            .padding(.top, 30)
                            ScrollView(.horizontal) {
                                HStack(spacing: 15) {
                                    ForEach($viewModel.flashProducts, id: \.self) { $product in
                                        FlashView(viewModel: viewModel, favouriteProducts: $viewModel.favouriteProducts, flashProduct: Product(category: product.category, name: product.name, price: product.price, image_url: product.image_url, discount: product.discount))
                                    }
                                }
                            }
                            .padding(.leading, 20)
                        }
                        Spacer()
                    }
                }
                if viewModel.visabilityIndex == 1 {
                        List {
                            ForEach($viewModel.containerArray, id: \.self) { $product in
                                ProductView(viewModel: viewModel, favouriteProducts: $viewModel.favouriteProducts, product: Product(category: product.category, name: product.name, price: product.price, image_url: product.image_url))
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
                        .onChange(of: viewModel.searchTextField) { newValue in
                            viewModel.searchByWord(term: newValue)
                        }
                }
                if viewModel.visabilityIndex == 2 || viewModel.visabilityIndex == 3 || viewModel.visabilityIndex == 4 || viewModel.visabilityIndex == 5 {
                    List {
                        ForEach($viewModel.categoryArray, id: \.self) { $product in
                            ProductView(viewModel: viewModel, favouriteProducts: $viewModel.favouriteProducts, product: Product(category: product.category, name: product.name, price: product.price, image_url: product.image_url))
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
                }
                Spacer(minLength: 100)
            }
            .padding(.top, 60)
        }
        .ignoresSafeArea()
    }
}

