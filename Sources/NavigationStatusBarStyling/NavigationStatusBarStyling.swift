//  Copyright © 2023 PRND. All rights reserved.

import UIKit

import StatusBarStyling


public enum NavigationStatusBarStyling {
    public static func setup() {
        StatusBarStyling.setup()
        // iOS 26부터는 시스템이 status bar 색상을 자동으로 처리하므로 스위즐링을 하지 않는다.
        guard #unavailable(iOS 26.0) else { return }
        UINavigationController.swizzlingForStatusBar()
    }
}
