//
//  DeleteProduct.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 25/09/23.
//

import Foundation

final class DeleteProductRepositoryImpl: DeleteProductRepository {
    func deleteProduct(for product: ProductCart) async {
        let url = URL(string: APIConstants.baseUrl.appending("/cart"))
        
        var urlComponents = URLComponents(url: url!, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = [
            URLQueryItem(name: "id_user", value: "001"),
            URLQueryItem(name: "id_product", value: product.id_product),
            URLQueryItem(name: "qtd_product", value: String(product.qtd_product)),
            URLQueryItem(name: "action", value: "remove"),
            URLQueryItem(name: "size", value: "39")
        ]
        
        var urlRequest = URLRequest(url: (urlComponents?.url)!)
        urlRequest.httpMethod = "POST"
        do {
            let (_, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                fatalError("Error")
            }
        } catch {
            print(error)
        }
    }
}
