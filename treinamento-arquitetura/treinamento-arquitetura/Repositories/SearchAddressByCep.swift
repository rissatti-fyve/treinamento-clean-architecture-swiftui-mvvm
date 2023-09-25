//
//  SearchAddressByCep.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 22/09/23.
//

import Foundation

final class SearchAddressByCepRepositoryImpl: SearchAddressByCepRepository {
    func get(cep: String) async throws -> AddressType {
        let urlSession = URLSession.shared
        let url = URL(string: APIConstants.baseUrl.appending("/-cep?cep=\(cep)"))
        let (data, _) = try await urlSession.data(from: url!)
        return try JSONDecoder().decode(AddressType.self, from: data)
    }
}
