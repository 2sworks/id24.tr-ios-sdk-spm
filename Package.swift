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
                 .upToNextMajor(from: "1.1.1700")),
        .package(url: "https://github.com/daltoniam/Starscream.git",
                 exact: "3.1.1"),
        .package(url: "https://github.com/stasel/WebRTC.git",
                 exact: "153.0.0"),
        .package(url: "https://github.com/sparrowcode/PermissionsKit",
                 .upToNextMajor(from: "10.0.1")),
        .package(url: "https://github.com/alankarmisra/SwiftSignatureView.git",
                 exact: "3.2.1"),
    ],
    targets: [
        .binaryTarget(
            name: "IdentifySDK",
            url: "https://github.com/2sworks/id24.tr-ios-sdk-spm/releases/download/3.1.2/IdentifySDK-3.1.2.xcframework.zip",
            checksum: "9d4b1f1f31d1b752f9056a9edcd39046bbb46446bab048e9d9c926dc31b80894"
        ),
        .target(
            name: "IdentifySDKWrapper",
            dependencies: [
                "IdentifySDK",
                .product(name: "OpenSSL", package: "OpenSSL"),
                .product(name: "Starscream", package: "Starscream"),
                .product(name: "WebRTC", package: "WebRTC"),
                .product(name: "CameraPermission", package: "PermissionsKit"),
                .product(name: "MicrophonePermission", package: "PermissionsKit"),
                .product(name: "SpeechRecognizerPermission", package: "PermissionsKit"),
                .product(name: "SwiftSignatureView", package: "SwiftSignatureView"),
            ],
            path: "Sources"
        )
    ]
)
