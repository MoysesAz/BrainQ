//
//  GameQuestionViewModel.swift
//  BrainQ
//
//  Created by Moyses Miranda do Vale Azevedo on 18/10/22.
//

import Foundation
protocol GameQuestionViewModelDelegate: AnyObject {
    func fatchQuestion()
}

class GameQuestionViewModel {
    var delegate: GameQuestionViewModelDelegate?

    private let _theme: TrivialThemes
    private let _level: TrivialLevels
    var theme: TrivialThemes {
        get { return _theme }
    }

    var level: TrivialLevels {
        get { return _level }
    }

    var model: ObservableObject<[TrivialResponseApi]?> = ObservableObject(nil)
    var questions: [String] = []
    var options: [String] = []
    var correct: String?

    init(theme: TrivialThemes, level: TrivialLevels) {
        self._theme = theme
        self._level = level
    }

    private func clearQuestions() {
    }

    func getQuestions() {
        TrivialRequestApi.getQuestions(theme: theme, level: level) { results in
            switch results {
            case .success(let resultModel):
                self.model.value = resultModel.results
            case .failure(let error):
                print(error)
            }
        }
    }

    func tratarQuestions() {
        guard let values = model.value else {return }
        for trivialResponse in values {
            var correct = [trivialResponse.correctAnswer]
            var incorrect = trivialResponse.incorrectAnswers
            self.correct = trivialResponse.correctAnswer
            self.options = correct + incorrect
            self.questions.append(trivialResponse.question)
        }

        print(self.questions)
        print(self.options)
        print(self.correct)

    }

}
