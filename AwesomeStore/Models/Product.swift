//
//  Product.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 11.06.2023.
//

import Foundation

struct Product: Codable, Hashable {
    var category: String = ""
    var name: String = ""
    var price: Double = 0.0
    var image_url: String = ""
    var discount: Int?
}
