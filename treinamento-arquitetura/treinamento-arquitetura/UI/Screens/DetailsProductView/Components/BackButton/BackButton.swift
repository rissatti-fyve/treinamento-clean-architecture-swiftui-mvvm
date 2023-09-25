//
//  BackButton.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 21/09/23.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button{ presentationMode.wrappedValue.dismiss()} label: {
            Circle()
                .foregroundColor(Color.white)
                .frame(width: 32, height: 32)
                .overlay(
                    Text(.init(systemName: "chevron.left"))
                        .foregroundColor(Color.black)
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                )
        }
    }
}
