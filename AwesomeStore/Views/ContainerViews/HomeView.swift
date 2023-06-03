//
//  HomeView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 25.04.2023.
//

import SwiftUI

struct HomeView: View {
    
    let location = ["Moscow", "Kazan", "Piter"]
    @State private var selectedCity = 0
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
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                        Picker("Location", selection: $selectedCity) {
                            ForEach(0..<3) { city in
                                Text("\(self.location[city])")
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
                                .background(selectedCategory == 1 ? .gray : .clear)
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
                                .background(selectedCategory == 2 ? .gray : .clear)
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
                                .background(selectedCategory == 3 ? .gray : .clear)
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
                                .background(selectedCategory == 4 ? .gray : .clear)
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
                            Button {
                                //
                            } label: {
                                Text("View all")
                                    .font(.custom("Montserrat", size: 15))
                                    .foregroundColor(.black)
                            }
                            
                        }
                        .padding(.horizontal, 30)
                        .padding(.top, 30)
                        ScrollView(.horizontal) {
                            HStack(spacing: 15) {
                                LatestView()
                                LatestView()
                                LatestView()
                            }
                        }
                        .padding(.leading, 10)
                    }
                    
                    VStack(spacing: 5) {
                        HStack {
                            Text("Flash sale")
                                .font(.custom("Montserrat-semibold", size: 25))
                            Spacer()
                            Button {
                                //
                            } label: {
                                Text("View all")
                                    .font(.custom("Montserrat", size: 15))
                                    .foregroundColor(.black)
                            }
                        }
                        .padding(.horizontal, 30)
                        .padding(.top, 30)
                        ScrollView(.horizontal) {
                            HStack(spacing: 15) {
                                FlashView()
                                FlashView()
                            }
                        }
                        .padding(.leading, 10)
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
