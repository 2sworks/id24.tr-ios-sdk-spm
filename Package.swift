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
            url: "https://github.com/2sworks/id24.tr-ios-sdk-spm/releases/download/2.5.9/IdentifySDK-2.5.9.xcframework.zip",
            checksum: "99f928aecdd5693ae60e818205a45cd32c919a6bb30606120bb6735fc76b782b"
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
