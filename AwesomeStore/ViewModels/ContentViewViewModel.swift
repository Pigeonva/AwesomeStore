//
//  ContentViewViewModel.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 26.04.2023.
//

import SwiftUI
import Combine

class ContentViewViewModel: ObservableObject {
    
    @ObservedObject var networkManager = NetworkManager()
    @Binding var goToRoot: Bool
    
    @Published var selection = "home"
    @Published var tabSelection: TabBarItem = .home
    
    @Binding var user: User
    @Published var selected = 0
    @Published var location = ["Moscow", "Kazan", "Piter", "Sochi", "Volgograd", "Kaliningrad", "Orenburg"]
    @Published var latestProducts = [Latest()]
    @Published var flashProducts = [Flash()]
    
    lazy private var getLatestProducts: AnyPublisher<[Latest], Never> = {
        networkManager.getLatestProducts()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }()
    
    lazy private var getFlashProducts: AnyPublisher<[Flash], Never> = {
        networkManager.getFlashProducts()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }()
    
    init(user: Binding<User>, goToRoot: Binding<Bool>) {
        self._user = user
        self._goToRoot = goToRoot
        getLatestProducts
            .assign(to: &$latestProducts)
        getFlashProducts
            .assign(to: &$flashProducts)
    }
}
