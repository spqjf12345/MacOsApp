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
        .commands {
            LandmarkCommands()
        }
    }
}
