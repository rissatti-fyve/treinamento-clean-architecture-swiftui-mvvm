//
//  GetProductByNameUseCase.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 25/09/23.
//

import Foundation

protocol GetProductByNameUseCase {
    func getProductByName(name: String) async throws -> ProductBack
}
