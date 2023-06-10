//
//  ContentView.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 25.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ContentViewViewModel
    
    var body: some View {
        
        CustomTabBarContainerView(selection: $viewModel.tabSelection) {
            HomeView(viewModel: self.viewModel)
                .tabBarItem(tab: .home, selection: $viewModel.tabSelection)
            FavoritesView(viewModel: self.viewModel)
                .tabBarItem(tab: .favorites, selection: $viewModel.tabSelection)
            CartView(viewModel: self.viewModel)
                .tabBarItem(tab: .cart, selection: $viewModel.tabSelection)
            ProfileView(viewModel: viewModel)
                .tabBarItem(tab: .profile, selection: $viewModel.tabSelection)
        }
        .navigationBarBackButtonHidden()
    }
}
