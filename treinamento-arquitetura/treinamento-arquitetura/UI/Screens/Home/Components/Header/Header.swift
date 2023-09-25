//
//  Header.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 21/09/23.
//

import SwiftUI

struct Header: View {
    var body: some View {
        HStack{
            SearchBar()
            Avatar(name: "Noah")
        }
        .padding(.horizontal,16)
        .padding(.bottom,8)
    }
}

