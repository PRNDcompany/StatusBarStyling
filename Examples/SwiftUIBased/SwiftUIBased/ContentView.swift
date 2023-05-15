//
//  ContentView.swift
//  SwiftUIBased
//
//  Created by PRND on 2023/01/12.
//

import SwiftUI

import StatusBarStyling


struct ContentView: View {
    var body: some View {
        TabView {
            ForEach(statusBarStyles, id: \.self) { statusBarStyle in
                RootView(statusBarStyle: statusBarStyle)
                    .tabItem {
                        Image(systemName: statusBarStyle.imageSystemName)
                        Text(statusBarStyle.title)
                    }
            }
        }
    }
    
    @State private var statusBarStyles: [UIStatusBarStyle] = [.default, .lightContent, .darkContent]
}

private extension ContentView {
    struct RootView: View {
        @State var statusBarStyle: UIStatusBarStyle
        @State var statusBarHidden: Bool = false
        
        var body: some View {
            NavigationStack {
                ZStack {
                    Color.gray.opacity(0.3).ignoresSafeArea()
                    
                    VStack {
                        hideButton
                        reverseButton
                        pushButton
                    }
                }
                .navigationTitle(statusBarStyle.title)
                .statusBar(style: statusBarStyle, hidden: statusBarHidden)
            }
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
        
        private var pushButton: some View {
            NavigationLink("Push(\(statusBarStyle.reversed.title))", value: statusBarStyle.reversed)
                .navigationDestination(for: UIStatusBarStyle.self) {
                   StatusBarStyleView(statusBarStyle: $0)
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
