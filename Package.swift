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
            targets: ["ChabokKit"])
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "ChabokKit",
            url: "https://github.com/chabok-io/chabok-ios/tree/main/ChabokKit.xcframework",
            checksum: "The checksum of the ZIP archive that contains the XCFramework."
        )
    ]
)
