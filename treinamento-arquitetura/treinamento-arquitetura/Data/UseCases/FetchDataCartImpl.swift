//
//  FetchDataCartIpl.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 22/09/23.
//

import Foundation

class FetchDataCartImp: FetchDataCartUseCase{
    private let repository: FetchDataCartRepository
    
    init(repository: FetchDataCartRepository){
        self.repository = repository
    }
    
    func fetchDataCart() async throws -> [ProductCart] {
        do{
            let dados =  try await repository.get()
            return dados
        } catch{
            print(error)
        }
            return []
    }
    }
