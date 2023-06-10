//
//  TabBarItem.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 10.06.2023.
//

import Foundation
import SwiftUI

enum TabBarItem: Hashable {
    case home, favorites, cart, profile
    
    var iconName: String {
        switch self {
        case .home: return "house"
        case .favorites: return "heart"
        case .cart: return "cart"
        case .profile: return "person"
        }
    }
    var title: String {
        switch self {
        case .home: return "Home"
        case .favorites: return "Favorites"
        case .cart: return "Cart"
        case .profile: return "Profile"
        }
    }
    var color: Color {
        switch self {
        case .home: return .blue
        case .favorites: return .blue
        case .cart: return .blue
        case .profile: return .blue
        }
    }
}
