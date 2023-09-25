//
//  FetchDataCart.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 22/09/23.
//

import Foundation

protocol FetchDataCartRepository {
    func get() async throws -> [ProductCart]
}
