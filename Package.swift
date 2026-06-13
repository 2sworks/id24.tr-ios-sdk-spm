// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "IdentifySDK",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "IdentifySDK", targets: ["IdentifySDKWrapper"])
    ],
    dependencies: [
        .package(url: "https://github.com/krzyzanowskim/OpenSSL.git",
                 .upToNextMajor(from: "1.1.1700")),
        .package(url: "https://github.com/daltoniam/Starscream.git",
                 exact: "3.1.1"),
        .package(url: "https://github.com/stasel/WebRTC.git",
                 .upToNextMajor(from: "94.0.0"))
    ],
    targets: [
        .binaryTarget(
            name: "IdentifySDK",
            url: "https://github.com/2sworks/id24.tr-ios-sdk-spm/releases/download/2.5.7/IdentifySDK-2.5.7.xcframework.zip",
            checksum: "ef4ce4758789c0c27f3b4073390a42ea90f050e715fc6c21132a3a6f6c074740"
        ),
        .target(
            name: "IdentifySDKWrapper",
            dependencies: [
                "IdentifySDK",
                "OpenSSL",
                .product(name: "Starscream", package: "Starscream"),
                .product(name: "WebRTC", package: "WebRTC")
            ],
            path: "Sources"
        )
    ]
)
