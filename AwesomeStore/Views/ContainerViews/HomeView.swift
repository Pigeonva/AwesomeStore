//
//  HomeView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 25.04.2023.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: ContentViewViewModel
    @State private var selectedCategory = 0
    @State var search = ""
    
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
                        .tint(.black)
                    }
                }
                .padding(.horizontal, 20)
                TextField("What are you looking for?", text: $search)
                    .font(.custom("Montserrat", size: 12))
                    .multilineTextAlignment(.center)
                    .frame(width: 289, height: 29)
                    .background(Color("TextField"))
                    .clipShape(Capsule())
                    .frame(width: 289, height: 29)
                HStack {
                    VStack(spacing: 1){
                        Button {
                            self.selectedCategory = 1
                        } label: {
                            Image(systemName: "iphone.rear.camera")
                                .padding(10)
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                .background(selectedCategory == 1 ? .blue.opacity(0.3) : .clear)
                                .clipShape(Circle())
                        }
                        Text("Phones")
                            .font(.footnote)
                    }
                    Spacer()
                    VStack(spacing: 1){
                        Button {
                            self.selectedCategory = 2
                        } label: {
                            Image(systemName: "gamecontroller")
                                .padding(10)
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                .background(selectedCategory == 2 ? .blue.opacity(0.3) : .clear)
                                .clipShape(Circle())
                        }
                        Text("Games")
                            .font(.footnote)
                    }
                    Spacer()
                    VStack(spacing: 1){
                        Button {
                            self.selectedCategory = 3
                        } label: {
                            Image(systemName: "car")
                                .padding(10)
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                .background(selectedCategory == 3 ? .blue.opacity(0.3) : .clear)
                                .clipShape(Circle())
                        }
                        Text("Cars")
                            .font(.footnote)
                    }
                    Spacer()
                    VStack(spacing: 1){
                        Button {
                            self.selectedCategory = 4
                        } label: {
                            Image(systemName: "soccerball")
                                .padding(10)
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                .background(selectedCategory == 4 ? .blue.opacity(0.3) : .clear)
                                .clipShape(Circle())
                        }
                        Text("Kids")
                            .font(.footnote)
                    }
                }
                .padding(.horizontal, 50)
                .padding(.top, 20)
                
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
                                ForEach(viewModel.latestProducts, id: \.self) { product in
                                    LatestView(category: product.category, name: product.name, price: product.price, imageUrl: product.image_url)
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
                                ForEach(viewModel.flashProducts, id: \.self) { product in
                                    FlashView(category: product.category, name: product.name, price: product.price, discount: product.discount ?? 0, imageUrl: product.image_url)
                                }
                            }
                        }
                        .padding(.leading, 20)
                    }
                    Spacer()
                }
                Spacer(minLength: 100)
            }
            .padding(.top, 60)
        }
        .ignoresSafeArea()
    }
}

