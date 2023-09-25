//
//  CardProductHome.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 21/09/23.
//

import SwiftUI
import UIKit

struct CardProductHome: View {
    var product: ProductBack
    @State private var image: UIImage? = nil
    
    var body: some View {
            VStack(alignment: .leading, spacing: 3){
                if let image = image {
                               Image(uiImage: image)
                                   .resizable()
                                   .scaledToFill()
                                   .frame(width: 175, height: 147)
                                   .clipped()
                                   .cornerRadius(4)
                           } else {
                               Color(white: 0.9)
                                   .frame(width: 175, height: 147)
                                   .onAppear {
                                       loadImageFromURL(product.images.principal) { loadedImage in
                                           DispatchQueue.main.async {
                                               self.image = loadedImage
                                        }
                                    }
                                }
                           }
                Text(product.categoria)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                Text(product.nome)
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
                HStack{
                    Text("R$ \(String(product.price))")
                        .foregroundColor(Color("GreenPrice"))
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                    //                if let descont  = Product.price {
                    //                    Text("R$ \(String(descont))")
                    //                        .foregroundColor(Color.gray)
                    //                        .font(.subheadline)
                    //                        .strikethrough(true, color: .gray)
                    //                }
                }
                
            }
        }
    }
