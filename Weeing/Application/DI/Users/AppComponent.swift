import SwiftUI
import NeedleFoundation

public final class AppComponent: BootstrapComponent {
    private let _keychain: any Keychain

    init(keychain: any Keychain) {
        self._keychain = keychain
    }

    public func makeRootView() -> some View {
        rootComponent.makeView()
    }

    public var keychain: any Keychain {
        shared {
            _keychain
        }
    }

    var rootComponent: RootComponent {
        shared {
            RootComponent(parent: self)
        }
    }
}

// MARK: - Auth
public extension AppComponent {
    var loginFactory: any LoginFactory {
        LoginComponent(parent: self)
    }
}
