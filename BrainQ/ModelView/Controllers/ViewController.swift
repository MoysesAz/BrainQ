//
//  ViewController.swift
//  BrainQ
//
//  Created by Moyses Miranda do Vale Azevedo on 18/10/22.
//

import UIKit

class ViewController: UIViewController {
    var teste = ["Sport", "computer", "Nature"]
    var teste2 = ["Easy", "medium", "hard"]
    var selector = SelectorQuestionsView()

    override func loadView() {
        self.view = selector
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        selector.selectorPicker.dataSource = self
        selector.selectorPicker.delegate = self
    }

}


extension ViewController: UIPickerViewDelegate {

}

extension ViewController: UIPickerViewDataSource {
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
