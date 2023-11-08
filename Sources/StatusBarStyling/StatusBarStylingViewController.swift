//  Copyright © 2023 PRND. All rights reserved.

import UIKit


final class StatusBarStylingViewController: UIViewController, StatusBarStyleControllable {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        statusBarStyle
    }
    
    override var prefersStatusBarHidden: Bool {
        statusBarHidden
    }
    
    override var childForStatusBarStyle: UIViewController? {
        nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNeedsStatusBarAppearanceUpdateToTopParent()
    }
    
    var statusBarStyle: UIStatusBarStyle {
        didSet {
            setNeedsStatusBarAppearanceUpdateToTopParent()
        }
    }
    
    var statusBarHidden: Bool {
        didSet {
            setNeedsStatusBarAppearanceUpdateToTopParent()
        }
    }
    
    func setNeedsStatusBarAppearanceUpdateToTopParent() {
        topParent().setNeedsStatusBarAppearanceUpdate()
    }
    
    required init(statusBarStyle: UIStatusBarStyle, statusBarHidden: Bool) {
        self.statusBarStyle = statusBarStyle
        self.statusBarHidden = statusBarHidden
        super.init(nibName: nil, bundle: nil)
        view = HiddenView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension StatusBarStylingViewController {
    final class HiddenView: UIView {
        required init() {
            super.init(frame: .zero)
            isHidden = true
            isUserInteractionEnabled = false
        }

        @available(*, unavailable)
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}

private extension UIViewController {
    func topParent() -> UIViewController {
        guard let parent else { return self }
        
        return parent.topParent()
    }
}
