//  Copyright © 2023 PRND. All rights reserved.

import SwiftUI


extension View {
    @ViewBuilder
    public func statusBar(style: UIStatusBarStyle, hidden: Bool = false) -> some View {
        // iOS 26부터는 시스템이 status bar 색상을 자동으로 처리하므로 VC를 주입하지 않는다.
        if #unavailable(iOS 26.0) {
            inject(StatusBarStylingView(statusBarStyle: style, statusBarHidden: hidden))
        } else {
            self
        }
    }
}

private extension View {
    func inject<SomeView>(_ view: SomeView) -> some View where SomeView: View {
        overlay(view.frame(width: .zero, height: .zero))
    }
}
