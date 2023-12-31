import Foundation

struct BoardGameShowResponseDTO: Codable {
    let boardgames: [BoardGameDTO]

    struct BoardGameDTO: Codable, Identifiable {
        let id: String
        let maxOf: Int
        let joined: Int
        let creator: CreatorDTO
        let players: [String]
        
        struct CreatorDTO: Codable {
            let info: String
            let id: String
        }
    }
}
