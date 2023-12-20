import Foundation

public struct AuthRepositoryImpl: AuthRepository {
    private let remoteAuthDataSource: RemoteAuthDataSource
    
    public init(
            remoteAuthDataSource: RemoteAuthDataSource
        ) {
            self.remoteAuthDataSource = remoteAuthDataSource
        }
    
    public func login(req: LoginRequestDTO) async throws {
            try await remoteAuthDataSource.login(req: req)
        }
}
