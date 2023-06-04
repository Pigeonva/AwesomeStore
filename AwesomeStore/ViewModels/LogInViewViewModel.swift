//
//  LogInViewViewModel.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 26.04.2023.
//

import SwiftUI
import Combine

class LogInViewViewModel: ObservableObject {
    @Published var user = User() {
        didSet {
            users[user.email] = user
        }
    }
    @Published var users = [String:User]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(users) {
                UserDefaults.standard.set(encoded, forKey: "Users")
            }
        }
    }
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var isUserExist = false
    
    private lazy var isUserExistPublisher: AnyPublisher<Bool, Never> = {
        Publishers.CombineLatest($email, $password)
            .map {self.checkUser(email: $0, password: $1) }
    .eraseToAnyPublisher()
    }()
    
    init() {
        getUsers()
        isUserExistPublisher.assign(to: &$isUserExist)
    }
    
    func getUsers() {
        if let users = UserDefaults.standard.data(forKey: "Users") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([String:User].self, from: users) {
                self.users = decoded
            }
        }
    }
    
    func checkUser(email: String, password: String) -> Bool {
        for i in users {
            if i.key == email.lowercased() && i.value.password == password.lowercased() {
                user = User(fullName: i.value.fullName,
                            email: i.value.email,
                            password: i.value.password,
                            balance: i.value.balance,
                            cityIndex: i.value.cityIndex)
                return true
            }
        }
        return false
    }
    
    func getErrorMessage() {
        isUserExistPublisher
            .map {
                $0 ? "" : "Incorrect Email or Password."
            }
            .assign(to: &$errorMessage)
    }
    
}
