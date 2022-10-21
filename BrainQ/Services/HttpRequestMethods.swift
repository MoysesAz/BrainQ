//
//  HttpVerbs.swift
//  BrainQ
//
//  Created by Moyses Miranda do Vale Azevedo on 14/10/22.
//

import Foundation

class HttpRequestMethods: AbstractHttpRequestMethods {
    func getRequest<T: Codable>(url: URL, objectResponse: T.Type, completion: @escaping (Result<T, Error>) -> Void ) {
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let responseData = data else {return }
            do {
                let objectResponse = try JSONDecoder().decode(objectResponse, from: responseData)
                completion(.success(objectResponse))
            } catch let error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
