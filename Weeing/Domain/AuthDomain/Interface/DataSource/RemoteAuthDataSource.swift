import Foundation

public protocol RemoteAuthDataSource {
    func login(req: LoginRequestDTO) async throws
}
