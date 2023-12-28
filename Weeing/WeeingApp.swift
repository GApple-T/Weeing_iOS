//
//  WeeingApp.swift
//  Weeing
//
//  Created by 이승화 on 2023/08/22.
//

import SwiftUI

@main
struct WeeingApp: App {
    @StateObject var sceneState = SceneState(sceneFlow: SceneFlow.login)

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(sceneState)
        }
    }
}
