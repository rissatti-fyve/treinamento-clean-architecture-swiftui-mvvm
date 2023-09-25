//
//  treinamento_arquiteturaApp.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 20/09/23.
//

import SwiftUI

@main
struct treinamento_arquiteturaApp: App {
    @StateObject var cart = Cart(useCaseFetchDataCart: FetchDataCartImp(repository: FetchDataCartRepositoryImpl()), useCaseDeleteProduct: DeleteProductImp(repository: DeleteProductRepositoryImpl()))
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(cart)
        }
    }
}
