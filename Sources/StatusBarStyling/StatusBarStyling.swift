//
//  StatusBarStylingViewController.swift
//
//
//  Created by PRND on 2023/01/12.
//

import SwiftUI


public enum StatusBarStyling {
    public static func setup() {
        UIHostingController<AnyView>.swizzlingForStatusBar()
    }
}
