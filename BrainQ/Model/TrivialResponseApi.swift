//
//  TrivialResponse.swift
//  BrainQ
//
//  Created by Moyses Miranda do Vale Azevedo on 14/10/22.
//

import Foundation

struct TrivialResponseApi: Codable {
    let category, type, difficulty, question: String
    let correctAnswer: String
    let incorrectAnswers: [String]

    enum CodingKeys: String, CodingKey {
        case category, type, difficulty, question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
}

extension TrivialResponseApi {
    struct WithResponseCode: Codable {
        let responseCode: Int
        let results: [TrivialResponseApi]
    }
}

extension TrivialResponseApi: Equatable {
    static func == (lhs: TrivialResponseApi, rhs: TrivialResponseApi) -> Bool {
        return
            lhs.category == rhs.category &&
            lhs.type == rhs.type &&
            lhs.difficulty == rhs.difficulty &&
            lhs.question == rhs.question &&
            lhs.correctAnswer == rhs.correctAnswer &&
            lhs.correctAnswer == rhs.correctAnswer
    }
}

extension TrivialResponseApi.WithResponseCode: Equatable {
    static func == (lhs: TrivialResponseApi.WithResponseCode, rhs: TrivialResponseApi.WithResponseCode) -> Bool {
        return
            lhs.responseCode == rhs.responseCode &&
            lhs.results == rhs.results
    }
}

extension TrivialResponseApi.WithResponseCode {
    enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case results
    }
}
