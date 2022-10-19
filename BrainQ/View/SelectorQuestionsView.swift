//
//  SelectorQuestionsViews.swift
//  BrainQ
//
//  Created by Moyses Miranda do Vale Azevedo on 18/10/22.
//

import UIKit

class SelectorQuestionsViews: UIView {

    lazy var categoryLabel: UILabel = {
        let categoryQuestion = UILabel()
        categoryQuestion.translatesAutoresizingMaskIntoConstraints = false
        categoryQuestion.text = "Sport"
        categoryQuestion.font = .systemFont(ofSize: 21)
        return categoryQuestion
    }()

    lazy var imageCategory: UIImageView = {
        let imageCategory = UIImageView()
        imageCategory.image = UIImage(named: "ErrorImage")
        imageCategory.translatesAutoresizingMaskIntoConstraints = false
        return imageCategory
    }()

    lazy var selectorTheme: UIPickerView = {
        let selectorTheme = UIPickerView()
        return selectorTheme
    }()

    lazy var selectorLevel: UIPickerView = {
        let selectorLevel = UIPickerView()
        return selectorLevel
    }()

    lazy var startButton: UIButton = {
        let startButton = UIButton(type: .system)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.setTitle("Start", for: .normal)
        startButton.tintColor = .white
        startButton.backgroundColor = .systemBlue
        return startButton
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
        self.addSubview(categoryLabel)
        self.addSubview(imageCategory)
        self.addSubview(selectorTheme)
        self.addSubview(selectorLevel)
        self.addSubview(startButton)
    }
}

extension SelectorQuestionsViews {
    func setConstraints() {
        imageCategoryConstraints()
    }

    private func categoryLabelConstraints() {
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: topAnchor),
            categoryLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            categoryLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9)
        ])
    }

    private func imageCategoryConstraints() {
        NSLayoutConstraint.activate([
            imageCategory.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor),
            imageCategory.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            imageCategory.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9)
        ])
    }

    

}
