//
//  FavouriteView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 25.04.2023.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        ZStack {
            Color("Background")
            VStack {
                Text("Favorites")
                    .font(.custom("Montserrat-semibold", size: 30))
                ScrollView {
                    VStack(spacing: 15){
                        LikeView()
                        LikeView()
                        LikeView()
                        LikeView()
                        LikeView()
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

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
