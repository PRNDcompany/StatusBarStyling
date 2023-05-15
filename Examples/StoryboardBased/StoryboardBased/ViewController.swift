//
//  ViewController.swift
//  StoryboardBased
//
//  Created by PRND on 2023/01/12.
//

import SwiftUI

import StatusBarStyling


final class ViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .systemBackground
        setHostingControllers(statusBarStyles: [.default, .lightContent, .darkContent])
    }
}

private extension ViewController {
    func setHostingControllers(statusBarStyles: [UIStatusBarStyle]) {
        setViewControllers(hostingControllers(statusBarStyles: statusBarStyles), animated: false)
        
        statusBarStyles.enumerated().forEach { (index, statusBarStyle) in
            tabBar.items?[index].title = statusBarStyle.title
            tabBar.items?[index].image = UIImage(systemName: statusBarStyle.imageSystemName)
        }
    }
    
    func hostingControllers(statusBarStyles: [UIStatusBarStyle]) -> [UIViewController] {
        statusBarStyles.map { statusBarStyle in
            UIHostingController(
                rootView: RootView(
                    statusBarStyle: statusBarStyle,
                    onPresentButtonTapped: { statusBarStyle in
                        let hostingController = UIHostingController(
                            rootView: StatusBarStyleView(statusBarStyle: statusBarStyle)
                        )
                        
                        hostingController.modalPresentationCapturesStatusBarAppearance = statusBarStyle != .default
                        
                        self.present(hostingController, animated: true)
                    }
                )
            )
        }
    }
    
    struct RootView: View {
        @State var statusBarStyle: UIStatusBarStyle
        @State var statusBarHidden: Bool = false
        let onPresentButtonTapped: (UIStatusBarStyle) -> Void
        
        var body: some View {
            VStack {
                Text(statusBarStyle.title).font(.largeTitle.bold()).padding(.bottom)
                hideButton
                reverseButton
                presentButton
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.gray.opacity(0.3))
            .statusBar(style: statusBarStyle, hidden: statusBarHidden)
        }
        
        private var hideButton: some View {
            Button(action: {
                statusBarHidden.toggle()
            }) {
                Text(statusBarHidden ? "Show" : "Hide")
            }
        }
        
        private var reverseButton: some View {
            Button(action: { statusBarStyle = statusBarStyle.reversed }) {
                Text("Reverse(\(statusBarStyle.reversed.title))")
            }
        }
        
        private var presentButton: some View {
            Button(action: { onPresentButtonTapped(statusBarStyle.reversed) }) {
                Text("Present(\(statusBarStyle.reversed.title))")
            }
        }
    }
    
    struct StatusBarStyleView: View {
        let statusBarStyle: UIStatusBarStyle
        
        var body: some View {
            Text("\(statusBarStyle.title)")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.gray.opacity(0.3).ignoresSafeArea())
                .statusBar(style: statusBarStyle)
        }
    }
}

private extension UIStatusBarStyle {
    var reversed: UIStatusBarStyle {
        switch self {
        case .`default`:    return .default
        case .lightContent: return .darkContent
        case .darkContent:  return .lightContent
        @unknown default:   return .default
        }
    }
    
    var title: String {
        switch self {
        case .`default`:    return ".default"
        case .lightContent: return ".lightContent"
        case .darkContent:  return ".darkContent"
        @unknown default:   return "unknown"
        }
    }
    
    var imageSystemName: String {
        switch self {
        case .`default`:    return "bolt.badge.a"
        case .lightContent: return "bolt"
        case .darkContent:  return "bolt.slash"
        @unknown default:   return "questionmark"
        }
    }
}
