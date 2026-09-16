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
                 .upToNextMajor(from: "94.0.0")),
        .package(url: "https://github.com/sparrowcode/PermissionsKit",
                 .upToNextMajor(from: "10.0.1")),
        .package(url: "https://github.com/alankarmisra/SwiftSignatureView.git",
                 exact: "3.2.1"),
    ],
    targets: [
        .binaryTarget(
            name: "IdentifySDK",
            url: "https://github.com/2sworks/id24.tr-ios-sdk-spm/releases/download/3.1.0/IdentifySDK-3.1.0.xcframework.zip",
            checksum: "f7e6bb4650adc6ddafadc4572573204adff3fe230780a8f4caf332a52ef55f8b"
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
