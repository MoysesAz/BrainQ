//
//  CardCategory.swift
//  BrainQ
//
//  Created by Moyses Miranda do Vale Azevedo on 16/10/22.
//

import UIKit

class GameQuestionView: UIView {
    lazy var questionCategory: UILabel = {
        let categoryQuestion = UILabel()
        categoryQuestion.translatesAutoresizingMaskIntoConstraints = false
        categoryQuestion.text = "Sport"
        categoryQuestion.font = .systemFont(ofSize: 21)

        return categoryQuestion
    }()

    lazy var question: UILabel = {
        let question = UILabel()
        question.translatesAutoresizingMaskIntoConstraints = false
        question.text = "O;oihjadsf;lhasd?"
        question.font = .systemFont(ofSize: 30, weight: .bold)
        return question
    }()

    lazy var imageCategory: UIImageView = {
        let imageCategory = UIImageView()
        imageCategory.image = UIImage(named: "ErrorImage")
        imageCategory.translatesAutoresizingMaskIntoConstraints = false
        return imageCategory
    }()

    lazy var answers: UICollectionView = {
        let answers = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        answers.register(AnswersViewCell.self, forCellWithReuseIdentifier: "AnswersViewCell")
        answers.translatesAutoresizingMaskIntoConstraints = false
        return answers
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubViews()
        self.setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubViews() {
        self.addSubview(questionCategory)
        self.addSubview(question)
        self.addSubview(imageCategory)
        self.addSubview(answers)
    }
}

extension GameQuestionView {
    func setConstraints() {
        questionCategoryConstraints()
        questionConstraints()
        imageCategoryConstraints()
        answersConstraints()
    }

    private func questionCategoryConstraints() {
        NSLayoutConstraint.activate([
            questionCategory.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height * 0.2),
            questionCategory.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.frame.width * 0.05)
            ])
    }

    private func questionConstraints() {
        NSLayoutConstraint.activate([
            question.topAnchor.constraint(equalTo: self.questionCategory.bottomAnchor, constant: 20),
            question.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.frame.width * 0.05)
            ])
    }

    private func imageCategoryConstraints() {
        NSLayoutConstraint.activate([
            imageCategory.topAnchor.constraint(equalTo: self.question.bottomAnchor, constant: 10),
            imageCategory.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.30),
            imageCategory.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            imageCategory.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.frame.width * 0.05)
            ])
    }

    private func answersConstraints() {
        NSLayoutConstraint.activate([
            answers.topAnchor.constraint(equalTo: self.imageCategory.bottomAnchor, constant: 20),
            answers.widthAnchor.constraint(equalTo: self.widthAnchor),
            answers.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
