//
//  ModifyViewsWithExtension.swift
//  BrainQ
//
//  Created by Moyses Miranda do Vale Azevedo on 18/10/22.
//

import Foundation
import UIKit

extension UIView {
    func roundCorners(cornerRadius: CGFloat, typeCorners: CACornerMask) {
        self.layer.cornerRadius = cornerRadius
        self.layer.maskedCorners = typeCorners
        self.clipsToBounds = true
    }

    func shadow() {
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        layer.shadowOpacity = 0.5
    }
}

extension CACornerMask {
    static public let topRight: CACornerMask = .layerMaxXMinYCorner
    static public let topLeft: CACornerMask = .layerMinXMinYCorner
    static public let bottomRight: CACornerMask = .layerMaxXMaxYCorner
    static public let bottomLeft: CACornerMask = .layerMinXMaxYCorner
}
