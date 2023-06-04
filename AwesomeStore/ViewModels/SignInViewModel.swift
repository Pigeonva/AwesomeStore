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
    var users = [User]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(users) {
                UserDefaults.standard.set(encoded, forKey: "Users")
            }
        }
    }
    
    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var nameMessage = ""
    @Published var emailMessage = ""
    @Published var passwordMessage = ""
    @Published var userMessage = ""
    @Published var isValid = false
    @Published var goToRoot = false
    @Published var goToRootTwo = false
    
    private lazy var isNameLengthValidPublisher: AnyPublisher<Bool, Never> = {
    $fullName
    .map { $0.count >= 3 }
    .eraseToAnyPublisher()
    }()
    
    private lazy var isEmailValidPublisher: AnyPublisher<Bool, Never> = {
    $email
            .map { self.textFieldValidatorEmail($0) }
    .eraseToAnyPublisher()
    }()
    
    private lazy var isUserValidPublisher: AnyPublisher<Bool, Never> = {
    $email
            .map { $0.lowercased()}
            .map { self.checkUser(email: $0) }
    .eraseToAnyPublisher()
    }()
    
    private lazy var isPasswordValidPublisher: AnyPublisher<Bool, Never> = {
    $password
    .map { $0.count >= 8 }
    .eraseToAnyPublisher()
    }()
    
    private lazy var formIsValid: AnyPublisher<Bool, Never> = {
        Publishers.CombineLatest4(isNameLengthValidPublisher, isEmailValidPublisher, isUserValidPublisher, isPasswordValidPublisher)
            .map {$0 && $1 && $2 && $3}
            .eraseToAnyPublisher()
    }()

    init() {
        getUsers()
        
        formIsValid.assign(to: &$isValid)
    }
    
    func textFieldValidatorEmail(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
    
    func checkUser(email: String) -> Bool {
        for item in users {
            if item.email == email {
                return false
            }
        }
        return true
    }
    
    func createUser() {
            if isValid {
                self.user = User(fullName: fullName, email: email.lowercased(), password: password)
                users.append(self.user)
            }
    }
    
    func getUsers() {
        if let users = UserDefaults.standard.data(forKey: "Users") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([User].self, from: users) {
                self.users = decoded
            }
        }
    }
    
    func getErrorMessages() {
        isNameLengthValidPublisher
            .map {
                $0 ? "" : "Needs to be at least 3 characters."
            }
            .assign(to: &$nameMessage)
        isUserValidPublisher
            .map {
                $0 ? "" : "This email is already using."
            }
            .assign(to: &$userMessage)
        isEmailValidPublisher
            .map {
                $0 ? "" : "Not valid email."
            }
            .assign(to: &$emailMessage)
        isPasswordValidPublisher
            .map {
                $0 ? "" : "Needs to be 7 more symbols."
            }
            .assign(to: &$passwordMessage)
    }
}


