//  Copyright © 2023 PRND. All rights reserved.

import SwiftUI


struct StatusBarStylingView: UIViewControllerRepresentable {
    let statusBarStyle: UIStatusBarStyle
    let statusBarHidden: Bool
    
    func makeUIViewController(
        context: Context
    ) -> StatusBarStylingViewController {
        StatusBarStylingViewController(statusBarStyle: statusBarStyle, statusBarHidden: statusBarHidden)
    }
    
    func updateUIViewController(
        _ uiViewController: StatusBarStylingViewController,
        context: Context
    ) {
        uiViewController.statusBarStyle = statusBarStyle
        uiViewController.statusBarHidden = statusBarHidden
    }
}
