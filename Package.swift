// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StatusBarStyling",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "StatusBarStyling",
            targets: ["StatusBarStyling"]
        ),
        .library(
            name: "NavigationStatusBarStyling",
            targets: ["NavigationStatusBarStyling"]
        ),
    ],
    targets: [
        .target(
            name: "StatusBarStyling",
            dependencies: []
        ),
        .target(
            name: "NavigationStatusBarStyling",
            dependencies: ["StatusBarStyling"]
        ),
        .testTarget(
            name: "StatusBarStylingTests",
            dependencies: ["StatusBarStyling"]
        ),
    ]
)
