//
//  GameQuestionViewController.swift
//  BrainQ
//
//  Created by Moyses Miranda do Vale Azevedo on 18/10/22.
//

import UIKit

class GameQuestionViewController: UIViewController {
    let respostas = ["Macaco", "Boi", "Peixe", "Dino"]

    let viewModel: GameQuestionViewModel
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
        contentView.answersCollectionView.dataSource = self
        contentView.answersCollectionView.delegate = self
    }
}

extension GameQuestionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return respostas.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnswersCollectionViewCell.indentifier,
                                                            for: indexPath) as? AnswersCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.text = respostas[indexPath.row]
        cell.roundCorners(cornerRadius: cell.frame.height/2, typeCorners: [.topRight, .topLeft, .bottomRight, .bottomLeft])
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

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
         return UIEdgeInsets(top: 1, left: 20, bottom: 1, right: 20)
    }
}
