import Foundation

public protocol AuthRepository {
    func login(req: LoginRequestDTO) async throws
}
