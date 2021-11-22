//
//  Package.swift
//  ChabokKit
//
//  Created by Hossein Shooshtari on 11/21/21.
//

import PackageDescription

let package = Package(
    name: "ChabokKit",
//    platforms: [
//        .macOS(.v10_14), .iOS(.v13), .tvOS(.v13)
//    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ChabokKit",
            targets: ["ChabokKit", "RemoteBinaryPackage", "LocalBinaryPackage"])
    ],
    dependencies: [
        .package(name: "Starscream",
                 url: "https://github.com/daltoniam/Starscream.git",
                 from: "4.0.4"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ChabokKit",
            exclude: ["README.md"],
            resources: [
                .copy("settings.plist")
            ]
        ),
        .binaryTarget(
            name: "RemoteBinaryPackage",
            url: "https://github.com/chabok-io/chabok-ios/tree/main/ChabokKit.xcframework"
        ),
        .binaryTarget(
            name: "LocalBinaryPackage",
            path: "/Users/husseinhj/Documents/chabok/plus/projects/ios/chabok-ios/chabok-ios/Build/ChabokKit.xcframework"
        )
    ]
)
