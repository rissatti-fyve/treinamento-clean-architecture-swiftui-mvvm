//
//  ApiError.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 22/09/23.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case requestFailed
    case invalidResponse
}
