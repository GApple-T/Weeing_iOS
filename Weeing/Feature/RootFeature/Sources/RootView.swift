//import SwiftUI
//
//struct RootView: View {
//    @EnvironmentObject var appState: AppState
//
//    private let loginFactory: any LoginFactory
//
//    public init(
//        loginFactory: any LoginFactory
//    ) {
//        self.loginFactory = loginFactory
//    }
//
//    var body: some View {
//        ZStack {
//            switch appState.sceneFlow {
//            case .auth:
//                loginFactory.makeView()
//                    .eraseToAnyView()
//                    .environmentObject(appState)
//            }
//        }
//        .animation(.easeInOut, value: appState.sceneFlow)
//        .transition(.opacity.animation(.easeInOut))
//    }
//}

import SwiftUI

struct RootView: View {
    @EnvironmentObject var sceneState: SceneState
    private let loginFactory: any LoginFactory
    
    public init(
        loginFactory: any LoginFactory
    ) {
        self.loginFactory = loginFactory
    }

    var body: some View {
        Group {
            switch sceneState.sceneFlow {
            case .login:
                loginFactory.makeView()
                    .eraseToAnyView()
                    .environmentObject(sceneState)
            }
        }
        .animation(.default, value: sceneState.sceneFlow)
    }
}
