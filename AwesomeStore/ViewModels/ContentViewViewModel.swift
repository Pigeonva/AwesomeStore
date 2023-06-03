//
//  ContentViewViewModel.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 26.04.2023.
//

import SwiftUI

class ContentViewViewModel: ObservableObject {
    var user: User
    @Published var selected = 0
    
    init(user: User) {
        self.user = user
    }
    
    func goToLoginView() {
        
    }
}
