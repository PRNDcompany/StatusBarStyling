<p align="left" width="100%">
    <img width="30%" src="https://github.com/PRNDcompany/StatusBarStyling/assets/97428093/e060e8c9-db7c-4292-8eae-420e3668ce83"> 
</p>

# StatusBarStyling
[![License](https://img.shields.io/badge/license-MIT-lightgray.svg)](https://github.com/PRNDCompany/StatusBarStyling/#license)
![Version](https://img.shields.io/github/v/release/PRNDcompany/StatusBarStyling.svg)
[![Swift Versions](https://img.shields.io/endpoint?url=https://swiftpackageindex.com/api/packages/PRNDcompany/StatusBarStyling/badge?type=swift-versions)](https://swiftpackageindex.com/PRNDcompany/StatusBarStyling)
[![OS's](https://img.shields.io/endpoint?url=https://swiftpackageindex.com/api/packages/PRNDcompany/StatusBarStyling/badge?type=platforms)](https://swiftpackageindex.com/PRNDcompany/StatusBarStyling)
![Xcode 14.0+](https://img.shields.io/badge/Xcode-14.0%2B-blue.svg)
[![SPM](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)

StatusBarStyle is an iOS library that makes it easy to style the status bar on SwiftUI views.

### How it works
This library is inspired by [SwiftUI-Introspect](https://github.com/siteline/SwiftUI-Introspect). It also works by adding `StatusBarStylingView` to the view hierarchy, and swizzles `childForStatusBarStyle`, `childForStatusBarHidden` getters of `UIHostingController` to refer to style of the status bar set in it. So it may not work as intended in projects that are already swizzling the getters.

* **StatusBarStyling:** StatusBarStyling provides `setup()` static function to be called when app is initialized and `statusBar(style:hidden:)` function that can be used as an extension of `SwiftUI.View`.

* **NavigationStatusBarStyling:** NavigationStatusBarStyling also provides `setup()` static function to be called when the app is initialized. The difference with StatusBarStyling is that it swizzles not only `UIHostingController`, but also `childForStatusBarStyle`, `childForStatusBarHidden` getters of `UINavigationController`. It is recommended to use this library unless you specifically override the corresponding properties. If you are already deep using `UINavigationController`, you can optionally use StatusBarStyling.

# Table of Contents
* [Requirements](#requirements)
* [Usage](#usage)
* [Examples](#examples)
    * [StoryboardBased](#storyboardbased)
    * [SwiftUIBased](#swiftuibased)
* [License](#license)

# Requirements <a name="requirements"></a>
StatusBarStyling codebase supports iOS and requires Xcode 14.0 or newer. This library has a Base SDK version of 14.0.

# Usage <a name="usage"></a>
First of all, it performs based on swizzling, you must be set it up when your app is initialized like:
```swift
import NavigationStatusBarStyling // or StatusBarStyling

final class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        NavigationStatusBarStyling.setup() // or StatusBarStyling.setup()
        return true
    }
}
```

And use `statusBar(style:hidden:)` function in SwiftUI views like:
```swift
import StatusBarStyling

struct ContentView: View {
    var body: some View {
        Text("ContentView")
            .statusBar(style: .lightContent, hidden: false)
    }
}
```

In general, the innermost status bar style in the view hierarchy is applied like:
```swift
import StatusBarStyling

struct ContentView: View {
    var body: some View {
        VStack {
            Text("1")
            
            VStack {
                Text("2")
                
                VStack {
                    Text("3")
                    
                    VStack {
                        Text("4")
                            .statusBar(style: .darkContent)
                    }
                }
            }
        }
        .statusBar(style: .lightContent)
    }
}
```
![In general, the innermost status bar style in the view hierarchy is applied.](https://github.com/PRNDcompany/StatusBarStyling/assets/97428093/4321f59e-acff-4b68-84e9-5e9b7e66b169)

# Examples <a name="examples"></a>
There are 2 example projects([StoryboardBased](https://github.com/PRNDcompany/StatusBarStyling/tree/main/Examples/StoryboardBased), [SwiftUIBased](https://github.com/PRNDcompany/StatusBarStyling/tree/main/Examples/SwiftUIBased)) in the repository, so refer to them when using them in your project.

### StoryboardBased <a name="storyboardbased"></a>
![StoryboardBased](https://github.com/PRNDcompany/StatusBarStyling/assets/97428093/a52f93b2-eb1a-40c4-96a4-3f37b4fd45eb)

### SwiftUIBased <a name="swiftuibased"></a>
![SwiftUIBased](https://github.com/PRNDcompany/StatusBarStyling/assets/97428093/a004d5ec-0f33-4f3e-a101-86554ad1a752)

# License <a name="license"></a>
This project is made available under the terms of a MIT license. See the [LICENSE](LICENSE) file.
