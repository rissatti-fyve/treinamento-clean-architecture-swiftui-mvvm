//
//  DetailsProductViewModel.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 25/09/23.
//

import Foundation
import UIKit

@MainActor
class DetailsProductViewModel: ObservableObject {
    private let useCase: SendPostRequestUseCase

    init(useCase: SendPostRequestUseCase) {
        self.useCase = useCase
        }
    
    func sendPostRequest(for product: ProductBack, for quantity: Int) async{
        await useCase.sendPostRequest(for: product, for: quantity)
    }
    
    }
