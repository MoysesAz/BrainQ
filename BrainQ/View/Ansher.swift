//
//  Ansher.swift
//  BrainQ
//
//  Created by Moyses Miranda do Vale Azevedo on 17/10/22.
//

import UIKit

class Ansher: UIView {
    lazy var ansher: UILabel = {
        let ansher = UILabel()
        ansher.translatesAutoresizingMaskIntoConstraints = false
        ansher.font = .systemFont(ofSize: 21, weight: .bold)
        ansher.textAlignment = .center
        ansher.backgroundColor = .cyan
        return ansher
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
