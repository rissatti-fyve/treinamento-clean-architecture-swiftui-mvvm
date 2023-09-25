//
//  ListProductsCart.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 22/09/23.
//

import SwiftUI

struct ListProductsCart: View {
    @State var isLoading: Bool = true
    @EnvironmentObject var cart: Cart
    
    var body: some View {
        ScrollView {
            ForEach(cart.products,id: \.id_product) { product in
                CardProductCart(product: product, cart: cart)
            }
        }
        .task {
            await cart.fetch()
        }
    }
}

