//
//  Obsevable.swift
//  BrainQ
//
//  Created by Moyses Miranda do Vale Azevedo on 21/10/22.
//

import Foundation

class ObservableObject<T> {

    var value: T {
        didSet {
            listener?(value)
        }
    }

    private var listener: ((T) -> Void)?

    init(_ value: T) {
        self.value = value
    }

    func bind(_ listener: @escaping (T) -> Void) {
        listener(value)
        self.listener = listener
    }
}
