// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CrowdinSDK",
    platforms: [
        .iOS(SupportedPlatform.IOSVersion.v9)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(name: "CrowdinSDK", targets: ["CrowdinSDK"]),
//        .library(name: "CrowdinProvider", targets: ["CrowdinProvider"]),
//        .library(name: "CrowdinAPI", targets: ["CrowdinAPI"]),
//        .library(name: "LoginFeature", targets: ["LoginFeature"]),
//        .library(name: "Screenshots", targets: ["Screenshots"]),
        
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/daltoniam/Starscream.git", from: "3.1.1"),
        .package(url: "https://github.com/serhii-londar/BaseAPI.git", from: "0.1.7")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(name: "CrowdinSDK", dependencies: ["BaseAPI", "Starscream"], path: "CrowdinSDK/Classes/", exclude: ["Providers/Firebase", "Settings"]),
        .testTarget(name: "CrowdinSDKTests", dependencies: ["BaseAPI", "Starscream", "CrowdinSDK"], path: "CrowdinSDK/Tests"),
        
//        .target(name: "CrowdinProvider", dependencies: ["CrowdinAPI", "CrowdinSDK"], path: "CrowdinSDK/Classes/Providers/Crowdin/"),
//        .testTarget(name: "CrowdinProviderTests", dependencies: ["CrowdinAPI", "CrowdinSDK"], path: "CrowdinSDK/Tests/CrowdinProvider"),
        
//        .target(name: "CrowdinAPI", dependencies: ["BaseAPI", "Starscream"], path: "CrowdinSDK/Classes/CrowdinAPI/"),
//        .testTarget(name: "CrowdinAPITests", dependencies: ["BaseAPI", "Starscream"], path: "CrowdinSDK/Tests/CrowdinAPI"),
        
//        .target(name: "LoginFeature", dependencies: ["BaseAPI", "CrowdinSDK", "CrowdinProvider", "CrowdinAPI"], path: "CrowdinSDK/Classes/Features/LoginFeature/"),
//        .target(name: "Screenshots", dependencies: ["BaseAPI", "CrowdinSDK", "CrowdinProvider", "CrowdinAPI", "LoginFeature"], path: "CrowdinSDK/Classes/Features/ScreenshotFeature/"),
    ]
)
