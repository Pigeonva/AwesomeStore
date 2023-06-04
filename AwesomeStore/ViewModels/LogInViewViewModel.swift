//
//  LogInViewViewModel.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 26.04.2023.
//

import SwiftUI
import Combine

class LogInViewViewModel: ObservableObject {
    @Published var user = User()
    @Published var users = [User]()
    
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
            if let decoded = try? decoder.decode([User].self, from: users) {
                self.users = decoded
            }
        }
    }
    
    func checkUser(email: String, password: String) -> Bool {
        var counter = -1
        for i in users {
            counter += 1
            if i.email == email.lowercased() && i.password == password.lowercased() {
                user = users[counter]
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
