//
//  SignInViewModel.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 26.04.2023.
//

import SwiftUI
import Combine

class SignInViewModel: ObservableObject {
    
    var user = User()
    var users = [User]()
    
    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var nameMessage = ""
    @Published var emailMessage = ""
    @Published var passwordMessage = ""
    @Published var isValid = false
    
    private lazy var isNameLengthValidPublisher: AnyPublisher<Bool, Never> = {
    $fullName
    .map { $0.count >= 3 }
    .eraseToAnyPublisher()
    }()

    init() {
        isNameLengthValidPublisher.assign(to: &$isValid)
        isNameLengthValidPublisher
            .map {
                $0 ? "" : "Full name too short. Needs to be at least 3 characters."
            }
            .assign(to: &$nameMessage)
    }
}


