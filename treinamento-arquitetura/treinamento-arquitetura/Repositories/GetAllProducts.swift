//
//  getAllProducts.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 20/09/23.
//

import Foundation

final class GetAllProductsRepositoryImpl: GetAllProductsRepository {
    func fetch() async throws -> ProductResponse {
        let urlSession = URLSession.shared
        let url = URL(string: APIConstants.baseUrl.appending("/products"))
        let (data, _) = try await urlSession.data(from: url!)
        return try JSONDecoder().decode(ProductResponse.self, from: data)
    }
}

