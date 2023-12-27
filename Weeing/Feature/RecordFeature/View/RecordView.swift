import SwiftUI

struct RootView: View {
    @EnvironmentObject var sceneState: SceneState

    var body: some View {
        Group {
            switch sceneState.sceneFlow {
            case .login:
                LoginView(viewModel: LoginViewModel())
                    .environmentObject(sceneState)
            case .main:
                MainView()
                    .environmentObject(sceneState)
            }
        }
        .animation(.default, value: sceneState.sceneFlow)
    }
}
