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
            targets: ["ChabokKit", "RemoteBinaryPackage"])
    ],
    dependencies: [],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        
        .target(name: "ChabokKit",
                path: "https://github.com/chabok-io/chabok-ios/tree/main/ChabokKit.xcframework")
        .binaryTarget(
            name: "RemoteBinaryPackage",
            url: "https://github.com/chabok-io/chabok-ios/tree/main/ChabokKit.xcframework"
        )
    ]
)
