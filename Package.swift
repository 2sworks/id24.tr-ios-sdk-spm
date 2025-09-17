// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "IdentifySDK",
    platforms: [.iOS(.v14)],
    products: [
        // Tüketici "import IdentifySDK" diyecek
        .library(name: "IdentifySDK", targets: ["IdentifySDK"])
    ],
    dependencies: [
        // İstediğiniz sürüm kısıtları
        .package(url: "https://github.com/krzyzanowskim/OpenSSL.git",
                 .upToNextMajor(from: "1.1.1700")),
        .package(url: "https://github.com/daltoniam/Starscream.git",
                 exact: "3.1.1"),
        .package(url: "https://github.com/stasel/WebRTC.git",
                 .upToNextMajor(from: "94.0.0"))
    ],
    targets: [
        // Önceden build ettiğiniz XCFramework
        .binaryTarget(
            name: "IdentifySDKBinary",
            url: "https://github.com/2sworks/id24.tr-ios-sdk-spm/releases/download/2.4.4/IdentifySDK.xcframework.zip",
            checksum: "2681e8daf97024bdf1065e2e17948489797411cbbf91463c24672841702a1067"
        ),

        // Wrapper: binary + bağımlılıkları bu target’a ekliyoruz
        .target(
            name: "IdentifySDK",
            dependencies: [
                "IdentifySDKBinary",
                "OpenSSL",
                .product(name: "Starscream", package: "Starscream"),
                .product(name: "WebRTC", package: "WebRTC")
            ],
            path: "Sources"
        )
    ]
)