//
//  ContentViewViewModel.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 26.04.2023.
//

import SwiftUI
import Combine

class ContentViewViewModel: ObservableObject {
    @Binding var user: User
    @Published var selected = 0 {
        didSet {
            currentView = defineView(number: selected)
        }
    }
    @Published var currentView: any View
    @Binding var goToRoot: Bool
    @Published var location = ["Moscow", "Kazan", "Piter", "Sochi", "Volgograd", "Kaliningrad"]
    private lazy var isSelectedPublisher: AnyPublisher<any View, Never> = {
        $selected
            .map {
                self.defineView(number: $0)
            }
            .eraseToAnyPublisher()
    }()
    
    init(user: Binding<User>, goToRoot: Binding<Bool>, currentView: any View) {
        self._user = user
        self._goToRoot = goToRoot
        self.currentView = EmptyView()
        isSelectedPublisher
            .assign(to: &$currentView)
    }
    
    func defineView(number: Int) -> any View {
        switch number {
        case 0:
            return HomeView(viewModel: self)
        case 1:
            return FavoritesView(viewModel: self)
        case 2:
            return CartView(viewModel: self)
        default:
            return ProfileView(viewModel: self, goToRoot: $goToRoot)
        }
    }
    
}
