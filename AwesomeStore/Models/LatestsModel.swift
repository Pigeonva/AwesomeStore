//
//  LatestsModel.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 07.06.2023.
//

import Foundation

struct LatestsModel: Codable {
    var latest: [Latest]
}

struct Latest: Codable, Hashable {
    var category: String = ""
    var name: String = ""
    var price: Int = 0
    var image_url: String = ""
}
