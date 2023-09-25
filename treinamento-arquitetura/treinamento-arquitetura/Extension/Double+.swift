//
//  Double+.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 20/09/23.
//

import Foundation

extension Double {
    func formatPrice() -> String {
        let formattedString = String(format: "%.2f", self)
        return formattedString.replacingOccurrences(of: ".", with: ",")
    }
}
