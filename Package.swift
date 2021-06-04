// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Panel",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "Panel",
            targets: ["Panel"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Panel",
            dependencies: []),
        .testTarget(
            name: "PanelTests",
            dependencies: ["Panel"]),
    ],
    swiftLanguageVersions: [.v5]
)
