//
//  CartBar.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 22/09/23.
//

import SwiftUI

struct CartBar: View {
    @EnvironmentObject var cart: Cart
    
    var formattedPrice: String {
        return String(format: "R$ %.2f", cart.calculateTotalPrice())
       }
    var body: some View {
        NavigationLink(destination: CartView()){
            HStack {
                Image(systemName: "cart")
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                    .overlay(
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 15, height: 15)
                                .offset(x: 10, y: -10)
                            Text("\(cart.countProducts())")
                                .font(.system(size: 8, weight: .medium))
                                .foregroundColor(.black)
                                .offset(x: 10, y: -10)
                        }
                    )
                Text("Visualizar carrinho")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .fontWeight(.medium)
                Spacer()
                Text("\(formattedPrice)")
                    .foregroundColor(.white)
            }
            .task {
                await cart.fetch()
            }
            .frame(maxWidth: .infinity)
            .padding(14)
            .padding(.vertical, 2)
            .background(Color.black)
        }
        }
    }
