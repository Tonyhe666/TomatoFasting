//
//  TomatoFastingApp.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/12.
//

import SwiftUI

@main
struct TomatoFastingApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    @Environment(\.scenePhase) private var scenePhase
    @StateObject var store = Store()
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(store)
            // app open url
                .onOpenURL(perform: { url in
                    debugPrint(url)
                })
            
            // app life circle
                .onChange(of: scenePhase) { phase in
                    switch phase {
                    case .background:
                        debugPrint("app .background")
                    case .inactive:
                        debugPrint("app .inactive")
                    case .active:
                        debugPrint("app .active")
                    @unknown default:
                        debugPrint("app .unknown")
                    }
                }
        }
    }
}
