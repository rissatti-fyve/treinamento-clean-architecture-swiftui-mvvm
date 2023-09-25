//
//  IconTitled.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 21/09/23.
//

import SwiftUI

struct IconTitled: View {
    let iconString: String
    let title: String
    
    var body: some View {
        VStack{
            Text(.init(systemName: iconString))
                .font(.system(size: 16))
                .fontWeight(.light)
            Text(title)
                .font(.system(size: 10))
        }
    }
}


