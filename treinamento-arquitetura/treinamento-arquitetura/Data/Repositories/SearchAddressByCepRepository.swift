//
//  SearchAddressByCepRepository.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 22/09/23.
//

import Foundation

protocol SearchAddressByCepRepository {
    func get(cep: String) async throws -> AddressType
}
