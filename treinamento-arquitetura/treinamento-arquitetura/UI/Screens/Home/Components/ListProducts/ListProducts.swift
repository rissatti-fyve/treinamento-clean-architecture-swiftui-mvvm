//
//  ListProducts.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 20/09/23.
//

import SwiftUI

struct ListProducts: View {
    @StateObject private var vm = ListProductsViewModel(
        useCase: GetAllProductsImpl(
            repository: GetAllProductsRepositoryImpl()
        )
    )
    
    let columns = [GridItem(), GridItem()]
    var body: some View {
        if vm.products.isEmpty {
            Text("Nenhum produto disponível")
                .foregroundColor(.gray)
                .font(.subheadline)
                .padding()
                .task {
                    await vm.getAllProductsToList()
                }
        } else {
            LazyVGrid(columns: columns) {
                ForEach(vm.products, id: \.id_product) { product in
                    NavigationLink(destination: DetailsProductView(product: product)) {
                        CardProductHome(product: product)
                    }
                }
            }
        }
    }
}

struct ListProducts_Previews: PreviewProvider {
    static var previews: some View {
        ListProducts()
    }
}
