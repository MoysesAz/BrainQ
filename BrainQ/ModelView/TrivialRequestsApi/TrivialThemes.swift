//
//  TrivialThemes .swift
//  BrainQ
//
//  Created by Moyses Miranda do Vale Azevedo on 14/10/22.
//

import Foundation

enum TrivialThemes: String, CaseIterable {
    case film
    case music
    case nature
    case computers
    case mathematics
    case mythology
    case history
    case animals
    case comics
    case animeAndManga

    func returnNumber() -> Int {
        switch self {
        case .film:
            return 11
        case .music:
            return 12
        case .nature:
            return 17
        case .computers:
            return 18
        case .mathematics:
            return 19
        case .mythology:
            return 20
        case .history:
            return 23
        case .animals:
            return 27
        case .comics:
            return 29
        case .animeAndManga:
            return 31
        }
    }
}
