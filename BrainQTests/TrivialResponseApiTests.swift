//
//  TrivialResponseApi.swift
//  BrainQTests
//
//  Created by Moyses Miranda do Vale Azevedo on 15/10/22.
//

import XCTest
@testable import BrainQ
final class TrivialResponseApiTests: XCTestCase {
    func testTrivialResponseApi_canCreateInstance() {
        XCTAssertNotNil(MockValues.question, "O valor deveria ser diferente de nil")
    }

    func testTrivialResponseApi_ShouldPassIfValidateCategory() {
        XCTAssertEqual(MockValues.question.category, "Animals", "O valor deveria ser igual a Animals")
    }

    func testTrivialResponseApi_ShouldPassIfValidateType() {
        XCTAssertEqual(MockValues.question.type, "multiple", "O valor deveria ser igual a multiple")
    }

    func testTrivialResponseApi_ShouldPassIfValidateQuestion() {
        XCTAssertEqual(MockValues.question.question, "test?", "O valor deveria ser igual a test?")
    }

    func testTrivialResponseApi_ShouldPassIfValidateCorrectAnswer() {
        XCTAssertEqual(MockValues.question.correctAnswer, "Tasmania, Australia",
                       "O valor deveria ser igual a Tasmania, Australia")
    }

    func testTrivialResponseApi_ShouldPassIfValidateIncorrectAnswers() {
        XCTAssertEqual(MockValues.question.incorrectAnswers,
                       ["Baluchistan, Pakistan",
                        "Wallachia, Romania",
                        "Oregon, United States"],
                        """
                        O valor deveria ser igual a\
                        \(["Baluchistan, Pakistan", "Wallachia, Romania", "Oregon, United States"])
                        """)
    }

    func testTrivialResponseApiWithResponseCode_ShouldEquatable() {
        XCTAssertEqual(MockValues.responseApi, MockValues.responseApi)
    }

    func testTrivialResponseApi_ShouldEquatable() {
        XCTAssertEqual(MockValues.question, MockValues.question)
    }

}
