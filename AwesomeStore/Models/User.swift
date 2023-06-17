//
//  User.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 26.04.2023.
//

import SwiftUI

struct User: Codable {
    var fullName = String()
    var email = String()
    var password = String()
    var balance: Double = 35000.0
}
