//
//  LatestsModel.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 07.06.2023.
//

import Foundation

struct LatestsModel: Codable {
    let latest: [Latest]
}

struct Latest: Codable {
    let category: String
    let name: String
    let price: Int
    let image_url: String
}
