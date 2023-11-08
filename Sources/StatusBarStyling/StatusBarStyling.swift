//  Copyright © 2023 PRND. All rights reserved.

import SwiftUI


public enum StatusBarStyling {
    public static func setup() {
        UIHostingController<AnyView>.swizzlingForStatusBar()
    }
}
