import Foundation

public final class RemoteAuthDataSourceImpl: BaseRemoteDataSource<AuthAPI>, RemoteAuthDataSource {
    
    public func login(req: LoginRequestDTO) async throws {
        try await request(.login(req))
    }
}
