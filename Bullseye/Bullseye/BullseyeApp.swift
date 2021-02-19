//
//  BullseyeApp.swift
//  Bullseye
//
//  Created by atj on 2021/01/09.
//

import SwiftUI

@main
struct BullseyeApp: App {
    // The only part of the lifecycle that you actually need to manually modify is the entry point.
    // Therefore, AppDelegate and SceneDelegate were deleted in SwiftUI.
    var body: some Scene {
        WindowGroup {
            NavigationView{
                // Entry point. (Root view)
                ContentView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
