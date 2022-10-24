//
//  ScoreboardViewController.swift
//  BrainQ
//
//  Created by Moyses Miranda do Vale Azevedo on 18/10/22.
//

import UIKit

class ScoreboardViewController: UIViewController {
    let viewModel: ScoreboardViewModel
    var contentView: ScoreboardView

    init(contentView: ScoreboardView = ScoreboardView(),
         viewModel: ScoreboardViewModel) {
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
        contentView.delegate = self
    }
}

extension ScoreboardViewController: ScoreboardDelegate {
    func play() {
        var viewModel = SelectorQuestionsViewModel()
        var view = SelectorQuestionsView(frame: view.frame)
        var controller = SelectorQuestionsViewController(contentView: view, viewModel: viewModel)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
