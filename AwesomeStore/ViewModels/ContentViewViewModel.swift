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
    @Binding var user: User
    
    //HomeView properties
    
    @Published var selection = "home"
    @Published var tabSelection: TabBarItem = .home
    @Published var visabilityIndex = 0 {
        didSet {
            getCategoryArray
                .assign(to: &$categoryArray)
        }
    }
    @Published var searchTextField = ""
    @Published var selected = 0
    @Published var location = ["Moscow", "Kazan", "Piter", "Sochi", "Volgograd", "Kaliningrad", "Orenburg"]
    @Published var cityIndex = 0
    @Published var latestProducts = [Product]()
    @Published var flashProducts = [Product]()
    @Published var containerArray = [Product]()
    @Published var categoryArray = [Product]()
    
    lazy var allProducts: [Product] = {
        var amount = latestProducts + flashProducts
        return amount
    }()
    
    lazy private var getLatestProducts: AnyPublisher<[Product], Never> = {
        networkManager.getLatestProducts()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }()
    
    lazy private var getFlashProducts: AnyPublisher<[Product], Never> = {
        networkManager.getFlashProducts()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }()
    
    lazy private var searchViewVisability: AnyPublisher<Int, Never> = {
        $searchTextField
            .map { text in
                if text.isEmpty {
                    return 0
                } else {
                    return 1
                }
            }
            .eraseToAnyPublisher()
    }()
    
    lazy private var getCategoryArray: AnyPublisher<[Product], Never> = {
        $visabilityIndex
            .map { index in
                return self.setCategories(index: index)
            }
            .eraseToAnyPublisher()
    }()
    
    // FavouritesView properties
    
    @Published var favouriteProducts = [Product]()
    
    // CartView properties
    
    @Published var cartProducts = [Product]()
    
    init(user: Binding<User>, goToRoot: Binding<Bool>) {
        self._user = user
        self._goToRoot = goToRoot
        getLatestProducts
            .assign(to: &$latestProducts)
        getFlashProducts
            .assign(to: &$flashProducts)
        searchViewVisability
            .assign(to: &$visabilityIndex)
    }
    
    func searchByWord(term: String = "") {
        let lowercasedSearchText = term.lowercased()
        if term.count > 1 {
            var matchingProduct = [Product]()
            allProducts.forEach { product in
                let searchContent = product.name
                if searchContent.lowercased().range(of: lowercasedSearchText, options: .regularExpression) != nil {
                    matchingProduct.append(product)
                }
            }
            self.containerArray = matchingProduct
        } else {
            self.containerArray = self.allProducts
        }
    }
    
    func setCategories(index: Int) -> [Product] {
        switch index {
        case 2:
            return filterByCategory(category: "phones")
        case 3:
            return filterByCategory(category: "games")
        case 4:
            return filterByCategory(category: "cars")
        default:
            return filterByCategory(category: "kids")
        }
    }
    
    func filterByCategory(category: String) -> [Product] {
        var array = [Product]()
        self.allProducts.forEach { product in
            if product.category.lowercased().range(of: category, options: .regularExpression) != nil {
                array.append(product)
            }
        }
        return array
    }
    
    func defineAmount(products: [Product]) -> Double {
        var amount = 0.0
        products.forEach { product in
            amount += product.price
        }
        return amount
    }
}
