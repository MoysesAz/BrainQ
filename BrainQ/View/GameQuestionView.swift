//
//  CardCategory.swift
//  BrainQ
//
//  Created by Moyses Miranda do Vale Azevedo on 16/10/22.
//

import UIKit

protocol GameViewQuestionDelegate {
    func configView()
}

class GameQuestionView: UIView {
    var delegate: GameViewQuestionDelegate?

    lazy var questionLabel: UILabel = {
        let question = UILabel()
        question.translatesAutoresizingMaskIntoConstraints = false
        question.numberOfLines = 0
        question.font = .systemFont(ofSize: 21, weight: .black)
        return question
    }()

    lazy var imageCategory: UIImageView = {
        let imageCategory = UIImageView()
        imageCategory.contentMode = .scaleToFill
        imageCategory.translatesAutoresizingMaskIntoConstraints = false
        return imageCategory
    }()

    lazy var answersCollectionView: UICollectionView = {
        let answersCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        answersCollectionView.register(AnswersCollectionViewCell.self, forCellWithReuseIdentifier: "AnswersViewCell")
        answersCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return answersCollectionView
    }()

    lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        return indicator
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubViews()
        self.setConstraints()
        self.loadingView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubViews() {
        addSubview(questionLabel)
        addSubview(imageCategory)
        addSubview(answersCollectionView)
        addSubview(indicator)
    }
}

extension GameQuestionView {
    func configview() {
        questionLabel.isHidden = false
        imageCategory.isHidden = false
        answersCollectionView.isHidden = false
        indicator.isHidden = true
    }

    func loadingView() {
        questionLabel.isHidden = true
        imageCategory.isHidden = true
        answersCollectionView.isHidden = true
        indicator.isHidden = false
    }
}

extension GameQuestionView {
    func setConstraints() {
        questionConstraints()
        imageCategoryConstraints()
        answersConstraints()
        indicatorConstraints()
    }

    private func questionConstraints() {
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            questionLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                   constant: frame.width * 0.05),
            questionLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                    constant: frame.width * -0.05)
        ])
    }

    private func imageCategoryConstraints() {
        NSLayoutConstraint.activate([
            imageCategory.bottomAnchor.constraint(equalTo: answersCollectionView.topAnchor,
                                                  constant: frame.height * -0.05),
            imageCategory.heightAnchor.constraint(equalTo: heightAnchor,
                                                  multiplier: 0.38),
            imageCategory.widthAnchor.constraint(equalTo: widthAnchor,
                                                 multiplier: 0.8),
            imageCategory.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    private func answersConstraints() {
        NSLayoutConstraint.activate([
            answersCollectionView.heightAnchor.constraint(equalTo: heightAnchor,
                                                          multiplier: 0.25),
            answersCollectionView.widthAnchor.constraint(equalTo: widthAnchor),
            answersCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func indicatorConstraints() {
        NSLayoutConstraint.activate([
            indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }

}
