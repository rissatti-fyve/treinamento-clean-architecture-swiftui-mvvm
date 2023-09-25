//
//  SearchAddressByCep.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 22/09/23.
//

import Foundation

class SearchAddressByCepImp: SearchAddressByCepUseCase {
    private let repository: SearchAddressByCepRepository
    
    init(repository: SearchAddressByCepRepository){
        self.repository = repository
    }
    
    func searchAddressByCep(cep: String) async throws -> AddressType {
        do{
            let dados =  try await repository.get(cep: cep)
            return dados
        } catch{
            print(error)
        }
        return AddressType(cep: "", street: "", neighborhood: "", city: "", state: "", freight: "")
    }
    }
