//
//  ContentView.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 20/09/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var cart: Cart
    var body: some View {
        NavigationView{
            VStack(spacing: 0){
                Header()
                Divider()
                HStack{
                    Text("Todos produtos")
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                    Text("(3 produtos)")
                        .foregroundColor(.gray)
                        .font(.system(size: 12))
                    Spacer()
                    Button{
                        
                    } label: {
                        Text("Visualizar todos")
                            .foregroundColor(.gray)
                            .font(.system(size: 12))
                    }
                }
                .padding(.top,12)
                .padding(.horizontal,16)
                ScrollView {
                    ListProducts()
                        .padding(.top, 12)
                }
                if cart.countProducts() > 0 {
                    CartBar()
                }
                Divider()
                HStack{
                    IconTitled(iconString: "square.grid.2x2", title: "Listagem")
                    Spacer()
                    IconTitled(iconString: "list.bullet.rectangle.portrait", title:"Pedidos" )
                }
                .task {
                    await cart.fetch()
                }
                .padding(.horizontal, 40)
                .padding(.top, 12)
            }
        }
        }
    }
