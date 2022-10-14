//
//  TrivialResponse.swift
//  BrainQ
//
//  Created by Moyses Miranda do Vale Azevedo on 14/10/22.
//

import Foundation

struct TrivialResponseApi: Codable {
    var category: String
    var type: String
    var difficulty: String
    var question: String
    var correctAnswer: String
    var incorrectAnswers: [String]

    enum Codingkeys: String, CodingKey {
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
}

extension TrivialResponseApi {
    struct WithResponseCode: Codable {
        var responseCode: Int
        var results: [TrivialResponseApi]

        enum Codingkeys: String, CodingKey {
            case responseCode = "response_code"
        }
    }
}
