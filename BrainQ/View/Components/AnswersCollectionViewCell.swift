//
//  AnswersViewCell.swift
//  BrainQ
//
//  Created by Moyses Miranda do Vale Azevedo on 17/10/22.
//

import UIKit

class AnswersCollectionViewCell: UICollectionViewCell {
    static let indentifier = "AnswersViewCell"

    lazy var answer: UILabel = {
        let answer = UILabel()
        answer.translatesAutoresizingMaskIntoConstraints = false
        answer.font = .systemFont(ofSize: 16, weight: .regular)
        answer.numberOfLines = 0
        answer.center = center
        return answer
    }()

    public var text: String {
        get {
            return answer.text ?? ""
        }
        set(text) {
            answer.text = text
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubViews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addSubViews() {
        addSubview(answer)
    }

    override func layoutSubviews() {
        answer.frame = contentView.frame
    }
}

extension AnswersCollectionViewCell {
    func setConstraints() {
        answerConstraints()

    }

    func answerConstraints() {
        NSLayoutConstraint.activate([
            answer.centerXAnchor.constraint(equalTo: centerXAnchor),
            answer.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])

    }
}
