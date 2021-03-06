//
//  MacOsAppApp.swift
//  MacOsApp
//
//  Created by JoSoJeong on 2022/03/30.
//

import SwiftUI

@main
struct MacOsAppApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        #if !os(watchOS)
        .commands {
            LandmarkCommands()
        }
        #endif
        
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif

        #if os(macOS)
        Settings {
            LandmarkSetting()
        }
        #endif
    }
}
