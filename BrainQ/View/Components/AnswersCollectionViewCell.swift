//
//  AnswersViewCell.swift
//  BrainQ
//
//  Created by Moyses Miranda do Vale Azevedo on 17/10/22.
//

import UIKit

class AnswersCollectionViewCell: UICollectionViewCell {
    static let reuseIndentifier = "AnswersViewCell"

    lazy var answer: UILabel = {
        let answer = UILabel()
        answer.translatesAutoresizingMaskIntoConstraints = false
        answer.textAlignment = .center
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
        backgroundColor = .gray
        addSubViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addSubViews() {
        addSubview(answer)
    }

    override func layoutSubviews() {
        answer.frame = contentView.bounds
    }
}
