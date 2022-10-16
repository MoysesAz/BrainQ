//
//  TrivialThemesTests.swift
//  BrainQTests
//
//  Created by Moyses Miranda do Vale Azevedo on 16/10/22.
//

import XCTest
@testable import BrainQ

final class TrivialThemesTests: XCTestCase {

    func testTrivialThemes_ShouldHave10Elements() {
        XCTAssertEqual(TrivialThemes.allCases.count, 10, "Deveriam existir 10 elementos interaveis")
    }

    func testTrivialThemes_WhenIteratedShouldHaveTheValuesInTheList() {
        var listStringsTrivialThemes: [String] = []
        for element in TrivialThemes.allCases {
            listStringsTrivialThemes.append(element.rawValue)
        }

        XCTAssertEqual(listStringsTrivialThemes, MockValues.categories,
                       "Os valores deveriam ser: \(MockValues.categories)")
    }

    func testReturnNumber() {
        var listCategoryCode: [Int] = []
        for element in TrivialThemes.allCases {
            listCategoryCode.append(element.returnNumber())
        }
        XCTAssertEqual(listCategoryCode, MockValues.listCategoryCode, "Os valores deveriam ser: \(MockValues.listCategoryCode)")
    }

}
