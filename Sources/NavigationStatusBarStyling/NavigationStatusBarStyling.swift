//  Copyright © 2023 PRND. All rights reserved.

import UIKit

import StatusBarStyling


public enum NavigationStatusBarStyling {
    public static func setup() {
        StatusBarStyling.setup()
        UINavigationController.swizzlingForStatusBar()
    }
}
