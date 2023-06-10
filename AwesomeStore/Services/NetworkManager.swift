//
//  NetworkManager.swift
//  AwesomeStore
//
//  Created by Артур Фомин on 07.06.2023.
//

import Foundation
import Combine

class NetworkManager: ObservableObject {
    
    func getLatestProducts() -> AnyPublisher<[Latest], Never> {
        guard let url = URL(string: "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7") else {
            return Just([Latest]()).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: LatestsModel.self, decoder: JSONDecoder())
            .map(\.latest)
            .replaceError(with: [])
            .eraseToAnyPublisher()
    }
    
    func getFlashProducts() -> AnyPublisher<[Flash], Never> {
        guard let url = URL(string: "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac") else {
            return Just([Flash]()).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: FlashModel.self, decoder: JSONDecoder())
            .map(\.flash_sale)
            .replaceError(with: [])
            .eraseToAnyPublisher()
    }
}
