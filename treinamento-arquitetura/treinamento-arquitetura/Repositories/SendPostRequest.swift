//
//  SendPostRequest.swift
//  treinamento-arquitetura
//
//  Created by Noah Rissatti Menezes Rodrigues on 22/09/23.
//

import Foundation

final class SendPostRequestRepositoryImpl: SendPostRequestRepository {
    func sendPostRequest(for product: ProductBack, for quantity: Int) async {
        let url = URL(string: APIConstants.baseUrl.appending("/cart"))
        
        var urlComponents = URLComponents(url: url!, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = [
            URLQueryItem(name: "id_user", value: "001"),
            URLQueryItem(name: "id_product", value: product.id_product),
            URLQueryItem(name: "qtd_product", value: String(quantity)),
            URLQueryItem(name: "action", value: "add"),
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
