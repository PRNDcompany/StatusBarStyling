//
//  AppDelegate.swift
//  SwiftUIBased
//
//  Created by PRND on 2023/01/12.
//

import UIKit

import NavigationStatusBarStyling


final class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(
        _ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        NavigationStatusBarStyling.setup()
        return true
    }
}
