// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "IdentifySDK",
    platforms: [.iOS(.v14)],
    products: [
        // Kullanıcı sadece import IdentifySDK diyecek
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
        // Asıl prebuilt XCFramework (modül adı IdentifySDK)
        .binaryTarget(
            name: "IdentifySDK",
            url: "https://github.com/2sworks/id24.tr-ios-sdk-spm/releases/download/2.3.14/IdentifySDK.xcframework.zip",
            checksum: "f1867b6fbe3948be9b9ccb09f4011d14c4d29ed02879a9033ad74ed004ab006c"
        ),

        // Wrapper: bağımlılıkları çözer, IdentifySDK’yı re-export eder
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
