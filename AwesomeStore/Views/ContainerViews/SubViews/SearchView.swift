//
//  SearchView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 11.06.2023.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: ContentViewViewModel
    
    var body: some View {
        List {
            ForEach($viewModel.latestProducts, id: \.self) { $product in
                LatestView(category: product.category, name: product.name, price: product.price, imageUrl: product.image_url)
            }
        }
        .padding(.horizontal, 20)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: ContentViewViewModel(user: .constant(User()), goToRoot: .constant(false)))
    }
}
