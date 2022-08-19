//
//  AXMusicApp.swift
//  AXMusic
//
//  Created by Ashwin Paudel on 2022-08-13.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        application.beginReceivingRemoteControlEvents()
        return true
    }
}

@main
struct AXMusicApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AXNowPlaying())
        }
    }
}
