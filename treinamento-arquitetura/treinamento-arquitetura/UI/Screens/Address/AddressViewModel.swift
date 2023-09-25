//
//  AddressViewModel.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 22/09/23.
//

import Foundation

@MainActor
class AddressViewModel: ObservableObject {
    @Published var cep = ""
    @Published var logradouro = ""
    @Published var numero = ""
    @Published var bairro = ""
    @Published var complemento = ""
    @Published var cidade = ""
    @Published var estado = ""
    
    private let useCase: SearchAddressByCepUseCase

    init(useCase: SearchAddressByCepUseCase) {
        self.useCase = useCase
        }

    func searchAddresByCep(cep: String) async{
        do{
            self.bairro =  try await useCase.searchAddressByCep(cep: cep).neighborhood
            self.cidade = try await useCase.searchAddressByCep(cep: cep).city
            self.estado = try await useCase.searchAddressByCep(cep: cep).state
            self.logradouro = try await useCase.searchAddressByCep(cep: cep).street
        }
        catch{
            print(error)
        }
    }
    }
