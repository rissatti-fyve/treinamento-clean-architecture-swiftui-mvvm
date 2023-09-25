//
//  ListProductsViewModel.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 20/09/23.
//

import Foundation

@MainActor
class ListProductsViewModel: ObservableObject {
    @Published private(set) var products: [ProductBack] = []
    private let useCase: GetAllProductsUseCase

    init(useCase: GetAllProductsUseCase) {
        self.useCase = useCase
        }

    func getAllProductsToList() async {
        do {
            self.products = try await useCase.getAllProducts().products
        } catch{
            print(error)
        }
    }
    }
