//
//  Cart.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 22/09/23.
//

import Foundation

@MainActor
class Cart: ObservableObject{
    @Published var products = [ProductCart]()
    
    private let useCaseFetchDataCart: FetchDataCartUseCase
    private let useCaseDeleteProduct: DeleteProductUseCase

    init(useCaseFetchDataCart: FetchDataCartUseCase, useCaseDeleteProduct: DeleteProductUseCase) {
        self.useCaseFetchDataCart = useCaseFetchDataCart
        self.useCaseDeleteProduct = useCaseDeleteProduct
    }
    
    func fetch() async {
        do{
            self.products = try await useCaseFetchDataCart.fetchDataCart()
        } catch {
            print(error)
        }
    }
    
    func delete(for product: ProductCart) async{
        await useCaseDeleteProduct.deleteProduct(for: product)
        await fetch()
    }
    
    func countProducts() -> Int {
        return products.reduce(0) { $0 + $1.qtd_product }
    }
    
    func calculateTotalPrice() -> Double {
        return products.reduce(0.0) { $0 + ($1.amount * Double($1.qtd_product)) }
    }
}
