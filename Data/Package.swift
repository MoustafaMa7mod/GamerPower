// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Data",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Data",
            targets: ["Data"]),
    ],
    dependencies: [
        .package(path: "../NetworkLayer"),
        .package(path: "../Domain")
        
    ],
    targets: [
        .target(
            name: "Data",
            dependencies: [
                "Domain",
                "NetworkLayer"
            ]),
        .testTarget(
            name: "DataTests",
            dependencies: ["Data"]
        ),
    ]
)
