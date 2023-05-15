//
//  SwiftUIBasedApp.swift
//  SwiftUIBased
//
//  Created by PRND on 2023/01/12.
//

import SwiftUI


@main
struct SwiftUIBasedApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    @UIApplicationDelegateAdaptor private var delegate: AppDelegate
}
