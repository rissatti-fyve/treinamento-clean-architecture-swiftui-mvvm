//
//  Avatar.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 21/09/23.
//

import SwiftUI

struct Avatar: View {
    let name: String
    
    var body: some View {
        Circle()
            .foregroundColor(.black)
            .frame(width: 40, height: 40)
            .overlay(
                Text(name.first?.description ?? "")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
            )
    }
}
