//
//  SignInViewModel.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 26.04.2023.
//

import SwiftUI

class SignInViewModel: ObservableObject {
    
    var user = User()
    
    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    var users = [User]()
    var isHidden = true
    @Published var showAlert = false
    var title = ""
    var message = ""
    
    func checkTextFields() {
       
    }

}


