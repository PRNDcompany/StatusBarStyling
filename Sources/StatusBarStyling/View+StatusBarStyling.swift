//
//  View+StatusBarStyling.swift
//  
//
//  Created by PRND on 2023/01/12.
//

import SwiftUI


extension View {
    public func statusBar(style: UIStatusBarStyle, hidden: Bool = false) -> some View {
        inject(StatusBarStylingView(statusBarStyle: style, statusBarHidden: hidden))
    }
}

private extension View {
    func inject<SomeView>(_ view: SomeView) -> some View where SomeView: View {
        overlay(view.frame(width: .zero, height: .zero))
    }
}
