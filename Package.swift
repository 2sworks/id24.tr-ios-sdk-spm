// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "IdentifySDK",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "IdentifySDK",
            targets: ["IdentifySDK"]
        )
    ],
    dependencies: [
        // OpenSSL — up to next major from 1.1.1700
        .package(
            url: "https://github.com/krzyzanowskim/OpenSSL.git",
            .upToNextMajor(from: "1.1.1700")
        ),
        // Starscream — exact 3.1.1
        .package(
            url: "https://github.com/daltoniam/Starscream.git",
            exact: "3.1.1"
        ),
        // WebRTC — up to next major from 94.0.0
        .package(
            url: "https://github.com/stasel/WebRTC.git",
            .upToNextMajor(from: "94.0.0")
        )
    ],
    targets: [
        .binaryTarget(
            name: "IdentifySDK",
            url: "https://github.com/2sworks/id24.tr-ios-sdk-spm/releases/download/2.3.9/IdentifySDK.xcframework.zip",
            checksum: "2681e8daf97024bdf1065e2e17948489797411cbbf91463c24672841702a1067"
        )
    ]
)