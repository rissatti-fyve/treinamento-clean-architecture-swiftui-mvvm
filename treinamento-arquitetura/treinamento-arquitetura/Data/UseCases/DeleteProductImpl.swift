//
//  DeleteProductImpl.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 25/09/23.
//

import Foundation

class DeleteProductImp: DeleteProductUseCase{
    private let repository: DeleteProductRepository
    
    init(repository: DeleteProductRepository){
        self.repository = repository
    }
    
    func deleteProduct(for product: ProductCart) async -> Void {
        await repository.deleteProduct(for: product)
    }
}
