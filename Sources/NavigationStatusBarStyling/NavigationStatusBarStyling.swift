//
//  NavigationStatusBarStyling.swift
//  
//
//  Created by PRND on 2023/01/12.
//

import UIKit

import StatusBarStyling


public enum NavigationStatusBarStyling {
    public static func setup() {
        StatusBarStyling.setup()
        UINavigationController.swizzlingForStatusBar()
    }
}
