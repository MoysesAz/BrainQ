//
//  Mocks.swift
//  BrainQTests
//
//  Created by Moyses Miranda do Vale Azevedo on 16/10/22.
//

import Foundation

struct MockValues {
    static let question = TrivialResponseApi(category: "Animals",
                                             type: "multiple",
                                             difficulty: "medium",
                                             question: "test?",
                                             correctAnswer: "Tasmania, Australia",
                                             incorrectAnswers: ["Baluchistan, Pakistan",
                                                                "Wallachia, Romania",
                                                                "Oregon, United States"])

    static let responseApi = TrivialResponseApi.WithResponseCode(responseCode: 0, results: [question])

    static let url = URL(string: "https://opentdb.com/api.php?amount=5&category=27&difficulty=medium&type=multiple")!

    static let categories = ["film", "music", "nature", "computers", "mathematics", "mythology", "history", "animals", "comics", "anime"]
    static let listCategoryCode = [11, 12, 17, 18, 19, 20, 23, 27, 29, 31]

}

