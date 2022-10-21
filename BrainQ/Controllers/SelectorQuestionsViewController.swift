//
//  SelectorQuestionsControllerViewController.swift
//  BrainQ
//
//  Created by Moyses Miranda do Vale Azevedo on 18/10/22.
//

import UIKit

class SelectorQuestionsViewController: UIViewController {
    let viewModel: SelectorQuestionsViewModel
    var contentView: SelectorQuestionsView

    init(contentView: SelectorQuestionsView = SelectorQuestionsView(),
         viewModel: SelectorQuestionsViewModel) {
        self.contentView = contentView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = contentView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.selectorPicker.dataSource = self
        contentView.selectorPicker.delegate = self
        contentView.delegate = self
        viewModel.delegate = self
    }
}

extension SelectorQuestionsViewController: SelectorQuestionsDelegate {
    func changeTheme(themeString: String) {
        contentView.imageCategory.image = UIImage(named: themeString)
        contentView.categoryLabel.text = themeString
    }

    func start() {
        let theme = viewModel.theme
        let level = viewModel.level
        let gameQuestionViewModel = GameQuestionViewModel(theme: theme, level: level)
        let controller = GameQuestionViewController(viewModel: gameQuestionViewModel)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension SelectorQuestionsViewController: SelectorQuestionsViewModelDelegate {
}

extension SelectorQuestionsViewController: UIPickerViewDelegate {

}

extension SelectorQuestionsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return viewModel.themes.count
        case 1:
            return viewModel.levels.count
        default:
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            let row = viewModel.themes[row]
            return row.rawValue
        case 1:
            let row = viewModel.levels[row]
            return row.rawValue
        default:
            return nil
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            let theme = viewModel.themes[row]
            changeTheme(themeString: theme.rawValue)
            viewModel.theme = theme
        case 1:
            let level = viewModel.levels[row]
            viewModel.level = level
        default:
            print("error")
        }
    }
}
