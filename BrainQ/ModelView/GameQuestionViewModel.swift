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

    var theme: TrivialThemes { return _theme }

    var level: TrivialLevels { return _level }

    private var _response: ObservableObject<[TrivialResponseApi]?> = ObservableObject(nil)
    var response: ObservableObject<[TrivialResponseApi]?> {
        get {return _response}
        set(value) {_response = value}
    }

    private var _questionPointer: Int = 0
    var questionPointer: Int {
        get {return _questionPointer}
        set(value) {_questionPointer = value}
    }

    private var _questions: [String] = []
    var questions: [String] {return _questions}

    private var _choices: [[String]] = []
    var choices: [[String]] {return _choices}

    private var _answers: [String] = []
    var answers: [String] {return _answers}

    private var _pontuation: Int = 0
    var pontuation: Int { return _pontuation }

    init(theme: TrivialThemes, level: TrivialLevels) {
        self._theme = theme
        self._level = level
    }

    func loadDataFromApi() {
        TrivialRequestApi.getQuestions(theme: theme, level: level) { results in
            switch results {
            case .success(let resultModel):
                self._response.value = resultModel.results
            case .failure(let error):
                print(error)
            }
        }
    }

    func preProcessingResponseForCache() {
        loadCacheQuestions()
        loadCacheAnswer()
        loadCacheChoices()
    }

    private func preProcessingResponse(completion: (TrivialResponseApi) -> Void) {
        guard let values = _response.value else {return }
        for trivialResponse in values {
            completion(trivialResponse)
        }
    }

    private func loadCacheQuestions() {
        preProcessingResponse { trivialResponse in
            self._questions.append(trivialResponse.question)
        }
    }

    private func loadCacheAnswer() {
        preProcessingResponse { trivialResponse in
            self._answers.append(trivialResponse.correctAnswer)
        }
    }

    private func loadCacheChoices() {
        preProcessingResponse { trivialResponse in
            let correct = [trivialResponse.correctAnswer]
            let incorrect = trivialResponse.incorrectAnswers
            let choices = correct + incorrect
            self._choices.append(choices)
        }
    }

    func nextQuestion() {
        guard _response.value != nil else {return }
        if _questionPointer < _questions.count - 1 {
            _questionPointer += 1
        }
    }

    func goal() {
        _pontuation += 1
    }

    func answerCheck(answer: String) -> Bool {
        return answer == _answers[_questionPointer] ? true : false
    }

}
