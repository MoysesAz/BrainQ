//
//  ViewController.swift
//  BrainQ
//
//  Created by Moyses Miranda do Vale Azevedo on 11/10/22.
//

import UIKit

class ViewController: UIViewController {
    let respostas = ["Macaco", "Boi", "Peixe", "Dino"]

    override func viewDidLoad() {
        let game = GameQuestionView(frame: self.view.frame)
        game.answers.dataSource = self
        game.answers.delegate = self

        view = game

        self.view = game
        super.viewDidLoad()
    }
}

extension ViewController: UICollectionViewDelegate {

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return respostas.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnswersViewCell.reuseIndentifier,
                                                            for: indexPath) as? AnswersViewCell else {
            return UICollectionViewCell()
        }
        cell.text = respostas[indexPath.row]
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width/2.3, height: self.view.frame.height/7)
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
