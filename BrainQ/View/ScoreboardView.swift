//
//  ScoreboardView.swift
//  BrainQ
//
//  Created by Moyses Miranda do Vale Azevedo on 18/10/22.
//

import UIKit

protocol ScoreboardDelegate: AnyObject {
    func play()
}

class ScoreboardView: UIView {

    weak var delegate: ScoreboardDelegate?

    lazy var scoreboardCollectionView: UICollectionView = {
        let scoreboardCollectionView = UICollectionView(frame: .zero,
                                                        collectionViewLayout: UICollectionViewFlowLayout())
        scoreboardCollectionView.translatesAutoresizingMaskIntoConstraints = false
        scoreboardCollectionView.register(AnswersCollectionViewCell.self, forCellWithReuseIdentifier: "AnswersViewCell")
        return scoreboardCollectionView
    }()

    lazy var playButton: UIButton = {
        let playButton = UIButton(type: .system)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.setTitle("Play", for: .normal)
        playButton.tintColor = .white
        playButton.backgroundColor = .systemBlue
        playButton.addTarget(self, action: #selector(play), for: .touchUpInside)
        return playButton
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubViews()
        setConstraints()

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addSubViews() {
        addSubview(scoreboardCollectionView)
        addSubview(playButton)
    }

}

extension ScoreboardView {
    @objc func play() {
        self.delegate?.play()
    }
}

extension ScoreboardView {
    func setConstraints() {
        scoreboardCollectionViewConstraints()
        playButtonConstraints()
    }

    func scoreboardCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            scoreboardCollectionView.topAnchor.constraint(equalTo: topAnchor),
            scoreboardCollectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            scoreboardCollectionView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }

    func playButtonConstraints() {
        NSLayoutConstraint.activate([
            playButton.topAnchor.constraint(equalTo: scoreboardCollectionView.bottomAnchor),
            playButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05),
            playButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            playButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
