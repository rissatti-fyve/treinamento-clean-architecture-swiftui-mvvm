//
//  GetAllProductsImpl.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 20/09/23.
//

import Foundation

class GetAllProductsImpl: GetAllProductsUseCase {
    private let repository: GetAllProductsRepository
    
    init(repository: GetAllProductsRepository){
        self.repository = repository
    }
    
    func getAllProducts() async throws -> ProductResponse {
        do{
            let dados =  try await repository.fetch()
            return dados
        } catch{
            print(error)
        }
        return ProductResponse(products: [])
    }
    }
