//
//  FetchDataCart.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 22/09/23.
//

import Foundation

final class FetchDataCartRepositoryImpl: FetchDataCartRepository {
//    func get() async throws -> [ProductCart] {
//        let urlSession = URLSession.shared
//        let url = URL(string: APIConstants.baseUrl.appending("cart?id_user=001"))
//        let (data, _) = try await urlSession.data(from: url!)
//        return try JSONDecoder().decode([ProductCart].self, from: data)
//    }
    
    func get() async throws -> [ProductCart] {
        guard let url = URL(string: APIConstants.baseUrl.appending("/cart?id_user=001")) else {
            fatalError("missing url")
        }
        
        do {
            let urlSession = URLSession.shared
            let (data, _) = try await urlSession.data(from: url)
            let products = try JSONDecoder().decode([ProductCart].self, from: data)
            return products
        } catch {
            print("Error: \(error)")
            throw error
        }
    }

}
