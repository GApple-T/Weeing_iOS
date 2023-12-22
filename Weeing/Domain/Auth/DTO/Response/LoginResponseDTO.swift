import Foundation

struct LoginResponseDTO: Decodable {
    let access: String
    let refresh: String
}
