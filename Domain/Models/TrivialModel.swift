import Foundation

struct TrivialModel {
    let levels: TrivialLevels
    let themes: TrivialThemes
}

enum TrivialLevels: String, CaseIterable {
    case easy
    case medium
    case hard
}

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
    case anime

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
        case .anime:
            return 31
        }
    }
}
