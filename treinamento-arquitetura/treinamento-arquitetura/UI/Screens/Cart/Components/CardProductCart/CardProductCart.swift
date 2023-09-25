//
//  CardProductCart.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 22/09/23.
//

import SwiftUI

struct CardProductCart: View {
    var product: ProductCart
    @State private var image: UIImage? = nil
    @State var quantity: Int = 1
    
    @ObservedObject var cart: Cart
    var body: some View {
        HStack{
            if let image = image {
                           Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 97 ,height: 108)
                            .cornerRadius(6)
                            .clipped()
                       } else {
                           Color(white: 0.9)
                               .frame(width: 175, height: 147)
                               .onAppear {
                                   loadImageFromURL(product.image) { loadedImage in
                                       DispatchQueue.main.async {
                                           self.image = loadedImage
                                    }
                                }
                            }
                       }
            VStack(alignment: .leading){
                Text(product.name)
                    .font(.subheadline)
                    .fontWeight(.medium)
                HStack{
                    Text("R$ \(String(product.amount))")
                        .foregroundColor(Color("GreenPrice"))
                        .font(.system(size: 12))
//                    if let descont  = product.descont {
//                        Text("R$ \(String(descont))")
//                            .foregroundColor(Color.gray)
//                            .font(.system(size: 12))
//                            .strikethrough(true, color: .gray)
//                    }
                }
                Spacer()
                HStack{
                    Counter(value: $quantity , isSmall: true)
                    Spacer()
                    Button{
                        Task{
                            await cart.delete(for: product)
                        }
                    } label: {
                        Text(.init(systemName: "trash.circle"))
                            .font(.system(size: 30))
                            .fontWeight(.light)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .padding(.horizontal,16)
        .frame(height: 108)
        .onAppear{
            quantity = product.qtd_product
        }
    }
    
}
