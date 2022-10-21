//
//  LoadView.swift
//  BrainQ
//
//  Created by Moyses Miranda do Vale Azevedo on 21/10/22.
//

import UIKit

class LoadView: UIView {
    lazy var teste: UIActivityIndicatorView = {
        let teste = UIActivityIndicatorView(style: .large)
        teste.center = center
        teste.startAnimating()
        return teste
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemRed
        self.addSubViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubViews() {
        addSubview(teste)
    }
}
