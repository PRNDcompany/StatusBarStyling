//
//  UIHostingController+StatusBarStyling.swift
//  
//
//  Created by PRND on 2023/01/12.
//

import SwiftUI


extension UIHostingController {
    static func swizzlingForStatusBar() {
        childForStatusBarStyleGetterSwizzling()
        childForStatusBarHiddenGetterSwizzling()
    }
}

private extension UIViewController {
    static func childForStatusBarStyleGetterSwizzling() {
        guard let originalMethod = class_getInstanceMethod(self, #selector(getter: childForStatusBarStyle)),
              let swizzledMethod = class_getInstanceMethod(Self.self, #selector(_childForStatusBarStyle))
        else { return }
        
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
    
    static func childForStatusBarHiddenGetterSwizzling() {
        guard let originalMethod = class_getInstanceMethod(self, #selector(getter: childForStatusBarHidden)),
              let swizzledMethod = class_getInstanceMethod(Self.self, #selector(_childForStatusBarHidden))
        else { return }
        
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
    
    @objc func _childForStatusBarStyle() -> UIViewController? {
        guard let viewController = findStatusBarStylingViewController() else {
            return _childForStatusBarStyle()
        }
        
        return viewController
    }
    
    @objc func _childForStatusBarHidden() -> UIViewController? {
        guard let viewController = findStatusBarStylingViewController() else {
            return _childForStatusBarHidden()
        }
        
        return viewController
    }
    
    func findStatusBarStylingViewController() -> UIViewController? {
        guard let targetController else {
            return findInChildren()
        }
        return targetController
    }
    
    func findInChildren() -> UIViewController? {
        guard let viewController = children.lazy.first(where: { $0 is StatusBarStylingViewController }) else {
            return children.lazy.compactMap { $0.findStatusBarStylingViewController() }.first
        }
        return viewController
    }
    
    var targetController: UIViewController? {
        switch self {
        case is UINavigationController, is UITabBarController, is StatusBarStylingViewController:
            return self
        default:
            return nil
        }
    }
}
