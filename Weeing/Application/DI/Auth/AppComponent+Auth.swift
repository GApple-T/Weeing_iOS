import Foundation

public extension AppComponent {
    var remoteAuthDataSource: any RemoteAuthDataSource {
            shared {
                RemoteAuthDataSourceImpl(keychain: keychain)
            }
        }

        var authRepository: any AuthRepository {
            shared {
                AuthRepositoryImpl(
                    remoteAuthDataSource: remoteAuthDataSource
                )
            }
        }

        var loginUseCase: any LoginUseCase {
            shared {
                LoginUseCaseImpl(authRepository: authRepository)
            }
        }
}
