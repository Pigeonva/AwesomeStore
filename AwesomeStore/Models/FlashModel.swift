//
//  FlashModel.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 10.06.2023.
//

import Foundation

struct FlashModel: Codable {
    var flash_sale: [Flash]
}

struct Flash: Codable, Hashable {
    var category: String = ""
    var name: String = ""
    var price: Double = 0.0
    var discount: Int = 0
    var image_url: String = ""
}
