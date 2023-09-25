//
//  DeleteProductRepository.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 25/09/23.
//

import Foundation

protocol DeleteProductRepository {
    func deleteProduct(for product: ProductCart) async -> Void
}
