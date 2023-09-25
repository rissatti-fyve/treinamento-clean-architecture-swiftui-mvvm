//
//  loadImageFromUrl.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 21/09/23.
//

import Foundation
import UIKit

func loadImageFromURL(_ urlString: String, completion: @escaping (UIImage?) -> Void) {
    guard let url = URL(string: urlString) else {
        completion(nil)
        return
    }

    URLSession.shared.dataTask(with: url) { data, _, error in
        if let data = data, error == nil {
            if let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(uiImage)
                }
            }
        } else {
            completion(nil)
        }
    }.resume()
}
