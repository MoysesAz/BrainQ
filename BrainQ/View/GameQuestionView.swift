//
//  CardCategory.swift
//  BrainQ
//
//  Created by Moyses Miranda do Vale Azevedo on 16/10/22.
//

import UIKit

protocol GameViewQuestionDelegate {
    func reloadData()
}

class GameQuestionView: UIView {
    var delegate: GameViewQuestionDelegate?

    lazy var categoryLabel: UILabel = {
        let categoryQuestion = UILabel()
        categoryQuestion.translatesAutoresizingMaskIntoConstraints = false
        categoryQuestion.text = ""
        categoryQuestion.font = .systemFont(ofSize: 21)
        return categoryQuestion
    }()

    lazy var questionLabel: UILabel = {
        let question = UILabel()
        question.translatesAutoresizingMaskIntoConstraints = false
        question.font = .systemFont(ofSize: 30, weight: .bold)
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
        self.addSubview(categoryLabel)
        self.addSubview(questionLabel)
        self.addSubview(imageCategory)
        self.addSubview(answersCollectionView)
        self.addSubview(indicator)
    }
}

extension GameQuestionView {
    func configview() {
        self.isHidden = false
        categoryLabel.isHidden = false
        questionLabel.isHidden = false
        imageCategory.isHidden = false
        answersCollectionView.isHidden = false
        indicator.isHidden = true
    }

    func loadingView() {
        categoryLabel.isHidden = true
        questionLabel.isHidden = true
        imageCategory.isHidden = true
        answersCollectionView.isHidden = true
        indicator.isHidden = false
    }
}

extension GameQuestionView {
    func setConstraints() {
        questionCategoryConstraints()
        questionConstraints()
        imageCategoryConstraints()
        answersConstraints()
        indicatorConstraints()
    }

    private func questionCategoryConstraints() {
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            categoryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.frame.width * 0.05)
        ])
    }

    private func questionConstraints() {
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: self.categoryLabel.bottomAnchor, constant: 10),
            questionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.frame.width * 0.05)
        ])
    }

    private func imageCategoryConstraints() {
        NSLayoutConstraint.activate([
            imageCategory.topAnchor.constraint(equalTo: self.questionLabel.bottomAnchor, constant: 10),
            imageCategory.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.30),
            imageCategory.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            imageCategory.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.frame.width * 0.05)
        ])
    }

    private func answersConstraints() {
        NSLayoutConstraint.activate([
            answersCollectionView.topAnchor.constraint(equalTo: self.imageCategory.bottomAnchor, constant: 20),
            answersCollectionView.widthAnchor.constraint(equalTo: self.widthAnchor),
            answersCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    private func indicatorConstraints() {
        NSLayoutConstraint.activate([
            indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }

}
