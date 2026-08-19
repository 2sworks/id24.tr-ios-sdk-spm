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
                 .upToNextMajor(from: "94.0.0")),
        .package(url: "https://github.com/sparrowcode/PermissionsKit",
                 .upToNextMajor(from: "10.0.1")),
        .package(url: "https://github.com/alankarmisra/SwiftSignatureView.git",
                 exact: "3.2.1"),
    ],
    targets: [
        .binaryTarget(
            name: "IdentifySDK",
            url: "https://github.com/2sworks/id24.tr-ios-sdk-spm/releases/download/3.0.0/IdentifySDK-3.0.0.xcframework.zip",
            checksum: "348659db6a9bbdf5584bc1546ba91c366e9a98fdc4cba8bc9abcc931823a4b54"
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
