//
//  WeeingApp.swift
//  Weeing
//
//  Created by 이승화 on 2023/08/22.
//

import SwiftUI

@main
struct WeeingApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView(viewModel: LoginViewModel(loginUseCase: LoginUseCaseImpl(authRepository: AuthRepositoryImpl(remoteAuthDataSource: RemoteAuthDataSourceImpl(keychain: KeychainImpl())))))
        }
    }
}
