//
//  SensPostRequestImpl.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 22/09/23.
//

import Foundation

class SendPostRequestImp: SendPostRequestUseCase{
    private let repository: SendPostRequestRepository
    
    init(repository: SendPostRequestRepository){
        self.repository = repository
    }
    
    func sendPostRequest(for product: ProductBack, for quantity: Int) async -> Void {
        await repository.sendPostRequest(for: product, for: quantity)
    }
}
