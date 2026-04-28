// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "IdentifySDK",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "IdentifySDK", targets: ["IdentifySDK"])
    ],
    targets: [
        .binaryTarget(
            name: "IdentifySDK",
            url: "https://github.com/2sworks/id24.tr-ios-sdk-spm/releases/download/2.5.5/IdentifySDK.xcframework.zip",
            checksum: "42d7a083b6828782f81c27e82df7c5b09767dda3febb227570a1a863663769d6"
        )
    ]
)
