//
//  HttpRequestMethods.swift
//  BrainQTests
//
//  Created by Moyses Miranda do Vale Azevedo on 16/10/22.
//

import XCTest
import Mocker
@testable import BrainQ

final class HttpRequestMethodsTests: XCTestCase {
    func testHttpRequestMethods_CanRetornInstance() throws {
        let url = MockValues.url
        let mock = Mock(
            url: url,
            dataType: .json,
            statusCode: 200,
            data: [
                .get: try JSONEncoder().encode(MockValues.responseApi)
            ]
        )
        mock.register()
        let api = HttpRequestMethods()
        api.getRequest(url: url, objectResponse: TrivialResponseApi.WithResponseCode.self) { respoonseApi in
            XCTAssertNotNil(respoonseApi)
        }
    }
}
