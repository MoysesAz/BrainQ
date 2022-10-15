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

        enum CodingKeys: String, CodingKey {
            case responseCode = "response_code"
            case results
        }
    }
}
