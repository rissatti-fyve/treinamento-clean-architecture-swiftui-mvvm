//
//  SearchBar.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 21/09/23.
//

import SwiftUI

struct SearchBar: View {
    @State var value: String = ""
    
    var body: some View {
        TextField("", text: $value)
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color("Border"), lineWidth: 1)
        )
        .overlay(
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color("Placement"))
                    .padding(.leading, 8)
                    .padding(.trailing, 4)
                Text("Pesquisar")
                    .foregroundColor(Color("Placement"))
                    .font(.system(size: 16))
                Spacer()
            }
                .opacity(value.isEmpty ? 1.0 : 0.0)
        )
        .padding(.vertical, 5)
        .padding(.horizontal, 5)
    }
}

