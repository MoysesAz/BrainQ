//
//  SelectorQuestionsViews.swift
//  BrainQ
//
//  Created by Moyses Miranda do Vale Azevedo on 18/10/22.
//

import UIKit

protocol SelectorQuestionsDelegate: AnyObject {
    func start()
    func changeTheme(themeString: String)
}

class SelectorQuestionsView: UIView {

    weak var delegate: SelectorQuestionsDelegate?

    lazy var categoryLabel: UILabel = {
        let categoryQuestion = UILabel()
        categoryQuestion.translatesAutoresizingMaskIntoConstraints = false
        categoryQuestion.font = .systemFont(ofSize: 21)
        categoryQuestion.text = "Film"
        return categoryQuestion
    }()

    lazy var imageCategory: UIImageView = {
        let imageCategory = UIImageView()
        imageCategory.contentMode = .scaleToFill
        imageCategory.translatesAutoresizingMaskIntoConstraints = false
        imageCategory.image = UIImage(named: "film")
        return imageCategory
    }()

    lazy var selectorPicker: UIPickerView = {
        let selectorPicker = UIPickerView()
        selectorPicker.translatesAutoresizingMaskIntoConstraints = false
        return selectorPicker
    }()

    lazy var startButton: UIButton = {
        let startButton = UIButton(type: .system)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.setTitle("Start", for: .normal)
        startButton.tintColor = .white
        startButton.backgroundColor = .systemBlue
        startButton.addTarget(self, action: #selector(start), for: .touchUpInside)
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
        self.addSubview(selectorPicker)
        self.addSubview(startButton)
    }
}

extension SelectorQuestionsView {
    @objc func start() {
        self.delegate?.start()
    }
}

extension SelectorQuestionsView {
    func setConstraints() {
        categoryLabelConstraints()
        imageCategoryConstraints()
        selectorPickerConstraints()
        startButtonConstraints()
    }

    private func categoryLabelConstraints() {
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100)
        ])
    }

    private func imageCategoryConstraints() {
        NSLayoutConstraint.activate([
            imageCategory.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor),
            imageCategory.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            imageCategory.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            imageCategory.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    private func selectorPickerConstraints() {
        NSLayoutConstraint.activate([
            selectorPicker.topAnchor.constraint(equalTo: imageCategory.bottomAnchor),
            selectorPicker.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            selectorPicker.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            selectorPicker.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }

    private func startButtonConstraints() {
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: selectorPicker.bottomAnchor),
            startButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            startButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            startButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
