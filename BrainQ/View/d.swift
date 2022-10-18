//
//  AnswerSelectorCell.swift
//  BrainQ
//
//  Created by Moyses Miranda do Vale Azevedo on 17/10/22.
//

import UIKit

class AnswerSelectorCell: UITableViewCell {

    static let indentifier = "customMoyses"

    lazy var number: UIImageView = {
        let number = UIImageView()
        number.image = UIImage(systemName: "1.circle")
        number.contentMode = .center
        return number
    }()

    lazy var text: UILabel = {
        let text = UILabel()
        text.text = "REWSPOSDlayoutSubViews()"
        return text
    }()

    lazy var stackview: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [number, text])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.frame = bounds
        return stackView
    }()

    func layoutSubViews() {
        addSubview(number)
        addSubview(stackview)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutSubViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AnswerSelectorCell {
}
