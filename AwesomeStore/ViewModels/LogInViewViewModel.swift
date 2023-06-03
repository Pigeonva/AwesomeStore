//
//  LogInViewViewModel.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 26.04.2023.
//

import SwiftUI

class LogInViewViewModel: ObservableObject {
    @Published var user = User()
    @Published var users = [User]()
    
    func correctData() {
        
    }
}
