// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "DarajaMultiplatform",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "DarajaMultiplatform",
            targets: ["DarajaMultiplatform"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "DarajaMultiplatform",
            path: "./DarajaMultiplatform.xcframework"
        ),
    ]
)
