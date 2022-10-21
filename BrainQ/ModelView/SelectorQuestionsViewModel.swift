//
//  SelectorQuestionsViewModel.swift
//  BrainQ
//
//  Created by Moyses Miranda do Vale Azevedo on 19/10/22.
//

import Foundation

protocol SelectorQuestionsViewModelDelegate: AnyObject {

}
class SelectorQuestionsViewModel {

    var delegate: SelectorQuestionsViewModelDelegate?

    private let listThemes = Array(TrivialThemes.allCases)
    private let listLevels = Array(TrivialLevels.allCases)
    private var themeSelect: TrivialThemes = .film
    private var levelSelect: TrivialLevels = .easy

    var themes: [TrivialThemes] {
        get {
            return listThemes
        }
    }

    var levels: [TrivialLevels] {
        get {
            return listLevels
        }
    }

    var theme: TrivialThemes {
        get {
            return themeSelect
        } set(trivialTheme) {
            themeSelect = trivialTheme
        }
    }

    var level: TrivialLevels {
        get {
            return levelSelect
        } set(trivialLevel) {
            levelSelect = trivialLevel
        }
    }
}
