//
//  FavouriteView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 25.04.2023.
//

import SwiftUI

struct FavoritesView: View {
    
    @ObservedObject var viewModel: ContentViewViewModel
    
    init(viewModel: ContentViewViewModel) {
        UICollectionView.appearance().backgroundColor = UIColor.clear
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Color("Background")
            VStack {
                Text("Favorites")
                    .font(.custom("Montserrat-semibold", size: 30))
                List {
                    ForEach($viewModel.favouriteProducts, id: \.self) { $product in
                        LikeView(viewModel: viewModel, favoriteProduct: Product(category: product.category, name: product.name, price: product.price, image_url: product.image_url))
                    }
                    .background(Color("Background"))
                }
                Spacer(minLength: 100)
            }
            .padding(.top, 50)
        }
        .ignoresSafeArea()
    }
}
