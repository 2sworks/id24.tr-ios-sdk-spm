// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "IdentifySDK",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "IdentifySDK", targets: ["IdentifySDKWrapper"])
    ],
    dependencies: [
        .package(url: "https://github.com/krzyzanowskim/OpenSSL.git",
                 exact: "3.6.5000"),
        .package(url: "https://github.com/stasel/WebRTC.git",
                 exact: "153.0.0"),
    ],
    targets: [
        .binaryTarget(
            name: "IdentifySDK",
            url: "https://github.com/2sworks/id24.tr-ios-sdk-spm/releases/download/3.3.0/IdentifySDK-3.3.0.xcframework.zip",
            checksum: "fe7393215d78e34bc190f01ec8e06153cd217d576c1b81edaa5d36223389ee04"
        ),
        .target(
            name: "IdentifySDKWrapper",
            dependencies: [
                "IdentifySDK",
                .product(name: "OpenSSL", package: "OpenSSL"),
                .product(name: "WebRTC", package: "WebRTC"),
            ],
            path: "Sources"
        )
    ]
)
