//  Copyright © 2023 PRND. All rights reserved.

import UIKit

import StatusBarStyling


extension UINavigationController {
    static func swizzlingForStatusBar() {
        childForStatusBarStyleGetterSwizzlingOfNavigationController()
        childForStatusBarHiddenGetterSwizzlingOfNavigationController()
    }
}

private extension UINavigationController {
    static func childForStatusBarStyleGetterSwizzlingOfNavigationController() {
        guard let originalMethod = class_getInstanceMethod(self, #selector(getter: childForStatusBarStyle)),
              let swizzledMethod = class_getInstanceMethod(Self.self, #selector(_childForStatusBarStyleOfNavigationController))
        else { return }
        
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
    
    static func childForStatusBarHiddenGetterSwizzlingOfNavigationController() {
        guard let originalMethod = class_getInstanceMethod(self, #selector(getter: childForStatusBarHidden)),
              let swizzledMethod = class_getInstanceMethod(Self.self, #selector(_childForStatusBarHiddenOfNavigationController))
        else { return }
        
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
    
    @objc func _childForStatusBarStyleOfNavigationController() -> UIViewController? {
        topViewController ?? _childForStatusBarStyleOfNavigationController()
    }
    
    @objc func _childForStatusBarHiddenOfNavigationController() -> UIViewController? {
        topViewController ?? _childForStatusBarHiddenOfNavigationController()
    }
}
