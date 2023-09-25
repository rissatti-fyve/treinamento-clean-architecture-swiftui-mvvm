//
//  DeleteProductUseCase.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 25/09/23.
//

import Foundation

protocol DeleteProductUseCase {
    func deleteProduct(for product: ProductCart) async -> Void
}
