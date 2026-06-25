//  Copyright © 2023 PRND. All rights reserved.

import SwiftUI


public enum StatusBarStyling {
    public static func setup() {
        // iOS 26부터는 시스템이 status bar 색상을 자동으로 처리하므로 스위즐링을 하지 않는다.
        guard #unavailable(iOS 26.0) else { return }
        UIHostingController<AnyView>.swizzlingForStatusBar()
    }
}
