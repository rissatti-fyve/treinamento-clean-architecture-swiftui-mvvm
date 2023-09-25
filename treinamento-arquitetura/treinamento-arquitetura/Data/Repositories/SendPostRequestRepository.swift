//
//  SendPostRequestRepository.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 22/09/23.
//

import Foundation

protocol SendPostRequestRepository {
    func sendPostRequest(for product: ProductBack, for quantity: Int) async -> Void
}
