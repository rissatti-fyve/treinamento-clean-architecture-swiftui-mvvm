//
//  GetAllProductRepository.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 20/09/23.
//

import Foundation

protocol GetAllProductsRepository {
    func fetch() async throws -> ProductResponse
}
