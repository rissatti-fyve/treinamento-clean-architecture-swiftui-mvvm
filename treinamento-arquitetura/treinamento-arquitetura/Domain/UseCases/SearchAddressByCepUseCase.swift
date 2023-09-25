//
//  SearchAddressByCepUseCase.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 22/09/23.
//

import Foundation

protocol SearchAddressByCepUseCase {
    func searchAddressByCep(cep: String) async throws -> AddressType
}
