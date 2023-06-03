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
    
    private lazy var isPasswordValidPublisher: AnyPublisher<Bool, Never> = {
    $password
    .map { $0.count >= 8 }
    .eraseToAnyPublisher()
    }()
    
    private lazy var isNameEmailValid: AnyPublisher<Bool, Never> = {
        Publishers.CombineLatest(isNameLengthValidPublisher, isEmailValidPublisher)
            .map {$0 && $1}
            .eraseToAnyPublisher()
    }()
    
    private lazy var formIsValid: AnyPublisher<Bool, Never> = {
        Publishers.CombineLatest(isNameEmailValid, isPasswordValidPublisher)
            .map {$0 && $1}
            .eraseToAnyPublisher()
    }()

    init() {
        formIsValid.assign(to: &$isValid)
        isNameLengthValidPublisher
            .map {
                $0 ? "" : "Needs to be at least 3 characters."
            }
            .assign(to: &$nameMessage)
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
    
    func textFieldValidatorEmail(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        //let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
}


