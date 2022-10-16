//
//  TrivialResponseApi.swift
//  BrainQTests
//
//  Created by Moyses Miranda do Vale Azevedo on 15/10/22.
//

import XCTest
@testable import BrainQ
final class TrivialResponseApiTests: XCTestCase {
    let response = TrivialResponseApi(category: "Animals",
                                      type: "multiple",
                                      difficulty: "medium",
                                      question: "test?",
                                      correctAnswer: "Tasmania, Australia",
                                      incorrectAnswers: ["Baluchistan, Pakistan",
                                                         "Wallachia, Romania",
                                                         "Oregon, United States"])

    func testTrivialResponseApi_canCreateInstance() {
        XCTAssertNotNil(response, "O valor deveria ser diferente de nil")
    }

    func testTrivialResponseApi_ShouldPassIfValidateCategory() {
        XCTAssertEqual(response.category, "Animals", "O valor deveria ser igual a Animals")
    }

    func testTrivialResponseApi_ShouldPassIfValidateType() {
        XCTAssertEqual(response.type, "multiple", "O valor deveria ser igual a multiple")
    }

    func testTrivialResponseApi_ShouldPassIfValidateQuestion() {
        XCTAssertEqual(response.question, "test?", "O valor deveria ser igual a test?")
    }

    func testTrivialResponseApi_ShouldPassIfValidateCorrectAnswer() {
        XCTAssertEqual(response.correctAnswer, "Tasmania, Australia", "O valor deveria ser igual a Tasmania, Australia")
    }

    func testTrivialResponseApi_ShouldPassIfValidateIncorrectAnswers() {
        XCTAssertEqual(response.incorrectAnswers,
                       ["Baluchistan, Pakistan",
                        "Wallachia, Romania",
                        "Oregon, United States"],
                        """
                        O valor deveria ser igual a\
                        \(["Baluchistan, Pakistan", "Wallachia, Romania", "Oregon, United States"])
                        """)
    }
}
