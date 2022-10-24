//
//  GameQuestionViewController.swift
//  BrainQ
//
//  Created by Moyses Miranda do Vale Azevedo on 18/10/22.
//

import UIKit

class GameQuestionViewController: UIViewController {
    var viewModel: GameQuestionViewModel
    var contentView: GameQuestionView

    init(contentView: GameQuestionView = GameQuestionView(),
         viewModel: GameQuestionViewModel) {
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
        self.navigationItem.title = viewModel.theme.rawValue.firstUppercased
        viewModel.loadDataFromApi()
        contentView.delegate = self
        viewModel.delegate = self
        self.viewModel.response.bind {[weak self] value in
            DispatchQueue.main.async {
                if value != nil {
                    self?.contentView.configview()
                    self?.viewModel.preProcessingResponseForCache()
                    self?.configView()
                    self?.contentView.answersCollectionView.dataSource = self
                    self?.contentView.answersCollectionView.delegate = self
                }
            }
        }
    }
}

extension GameQuestionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let choices = viewModel.choices[viewModel.questionPointer]
        let answer = choices[indexPath.row]
        let check = viewModel.answerCheck(answer: answer)
        if check {

            viewModel.goal()
            print("pontuou")
        }
        print(answer)

        viewModel.nextQuestion()
        print(viewModel.questions.count, viewModel.pontuation)
        if viewModel.questionPointer == viewModel.questions.count - 1 {
            print("salvar no banco de dados")
            self.navigationController?.popViewController(animated: true)
        } else {
            contentView.answersCollectionView.reloadData()
            configView()
        }
    }
}

extension GameQuestionViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnswersCollectionViewCell.indentifier,
                                                            for: indexPath) as? AnswersCollectionViewCell else {
            return UICollectionViewCell()
        }
        let choises = viewModel.choices[viewModel.questionPointer]
        cell.text = choises[indexPath.row]
        cell.roundCorners(cornerRadius: cell.frame.height/2,
                          typeCorners: [.topRight, .topLeft, .bottomRight, .bottomLeft])
        cell.shadow()
        return cell
    }
}

extension GameQuestionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width/2.3, height: self.view.frame.height/10)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 20, bottom: 1, right: 20)
    }
}

extension GameQuestionViewController: GameQuestionViewModelDelegate {
    func fatchQuestion() {
    }
}

extension GameQuestionViewController: GameViewQuestionDelegate {
    func configView() {
        contentView.configview()
        contentView.questionLabel.text = viewModel.questions[viewModel.questionPointer]
        contentView.imageCategory.image = UIImage(named: viewModel.theme.rawValue)
    }
}
