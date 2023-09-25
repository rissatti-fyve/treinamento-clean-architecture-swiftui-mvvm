//
//  AddressViewModel.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 22/09/23.
//

import Foundation

@MainActor
class AddressViewModel: ObservableObject {
    private let useCase: SearchAddressByCepUseCase

    init(useCase: SearchAddressByCepUseCase) {
        self.useCase = useCase
        }

    func getAllProductsToList(cep: String) async -> AddressType {
        do{
            return try await useCase.searchAddressByCep(cep: cep)
        }
        catch{
            print(error)
        }
        return AddressType(cep: "", street: "", neighborhood: "", city: "", state: "", freight: "")
    }
    }
