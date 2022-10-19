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

    var teste = ["Sport", "computer", "Nature"]
    var teste2 = ["Easy", "medium", "hard"]

    override func loadView() {
        self.view = contentView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.selectorPicker.dataSource = self
        contentView.selectorPicker.delegate = self
        contentView.delegate = self

    }

}

extension SelectorQuestionsViewController: SelectorQuestionsDelegate {
    func getController() {
        self.navigationController?.pushViewController(GameQuestionViewController(viewModel: GameQuestionViewModel(theme: .anime, level: .easy)), animated: true)
    }
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
            return teste.count
        case 1:
            return teste2.count
        default:
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            let row = teste[row]
            return row
        case 1:
            let row = teste2[row]
            return row
        default:
            return nil
        }
    }

}
