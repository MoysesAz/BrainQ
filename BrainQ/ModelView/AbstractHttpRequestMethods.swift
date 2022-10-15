//
//  AbstractHttpsVerbs.swift
//  BrainQ
//
//  Created by Moyses Miranda do Vale Azevedo on 14/10/22.
//

import Foundation

protocol AbstractHttpRequestMethods {
    func getRequest<T: Codable>(url: URL, objectResponse: T.Type, completion: @escaping (T
    ) -> Void)
}
