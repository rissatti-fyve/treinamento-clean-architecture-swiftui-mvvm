//
//  fetchDataCartUseCase.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 22/09/23.
//

import Foundation

protocol FetchDataCartUseCase {
    func fetchDataCart() async throws -> [ProductCart]
}
