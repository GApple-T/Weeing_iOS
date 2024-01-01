import Foundation

struct BoardGameShowResponseDTO: Codable {
    let boardgames: [BoardGameDTO]

    struct BoardGameDTO: Codable, Identifiable {
        let id: String
        let maxOf: Int
        let creator: CreatorDTO
        let players: [PlayerDTO]

        struct CreatorDTO: Codable {
            let id: String
            let grade: Int
            let classroom: Int
            let number: Int
            let name: String
        }

        struct PlayerDTO: Codable {
            let id: String
            let grade: Int
            let classroom: Int
            let number: Int
            let name: String
        }
    }
}
