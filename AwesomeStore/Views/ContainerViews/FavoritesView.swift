//
//  FavouriteView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 25.04.2023.
//

import SwiftUI

struct FavoritesView: View {
    
    @ObservedObject var viewModel: ContentViewViewModel
    
    var body: some View {
        ZStack {
            Color("Background")
            VStack {
                Text("Favorites")
                    .font(.custom("Montserrat-semibold", size: 30))
                ScrollView {
                    VStack(spacing: 15){
                        LikeView()
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 50)
        }
        .ignoresSafeArea()
    }
}
