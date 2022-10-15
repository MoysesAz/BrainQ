//
//  TrivialRequestApi.swift
//  BrainQ
//
//  Created by Moyses Miranda do Vale Azevedo on 14/10/22.
//

import Foundation

class TrivialRequestApi {
    private init() {}
    static func getQuestions(theme: TrivialThemes, level: TrivialLevels,
                             httpRequestMethods: AbstractHttpRequestMethods = HttpRequestMethods()) {
        let url = self.urlGenerator(theme: theme, level: level)
        guard let url else {return}
        httpRequestMethods.getRequest(url: url,
                                      objectResponse: (TrivialResponseApi.WithResponseCode).self) {apiResponse in
            for result in apiResponse.results {
                print("pergunta:", result.question)
                print("resposta:", result.correctAnswer)
                print("respostas erradas:", result.incorrectAnswers)
            }
        }
    }

    private static func urlGenerator(theme: TrivialThemes, level: TrivialLevels) -> URL? {
        var url = "https://opentdb.com/api.php?amount=5"
        url += "&category=\(theme.returnNumber())"
        url += "&difficulty=\(level.rawValue)"
        url += "&type=multiple"
        guard let newUrl = URL(string: url) else { return nil }
        return newUrl
    }
}
