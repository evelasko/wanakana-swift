// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "wanakana-swift",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "wanakana-swift",
            targets: ["wanakana-swift"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "wanakana-swift",
            dependencies: []),
        .testTarget(
            name: "wanakana-swiftTests",
            dependencies: ["wanakana-swift"]),
    ]
)
