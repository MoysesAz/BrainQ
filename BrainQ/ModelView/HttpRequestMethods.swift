//
//  HttpVerbs.swift
//  BrainQ
//
//  Created by Moyses Miranda do Vale Azevedo on 14/10/22.
//

import Foundation

class HttpRequestMethods: AbstractHttpsVerbs {
    private init() {}
    static func getRequest<T: Codable>(url: URL, objectResponse: T.Type, completion: @escaping (T) -> Void ) {
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let responseData = data else {return }
            do {
                let objectResponse = try JSONDecoder().decode(objectResponse, from: responseData)
                completion(objectResponse)
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }
}
