# id24.tr-ios-sdk-spm

### Swift Package Manager

In Xcode go to Project -> Your Project Name -> `Package Dependencies` -> Tap *Plus*. Insert url:

```
https://github.com/2sworks/id24.tr-ios-sdk-spm
```

Or adding it to the `dependencies` of your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/2sworks/id24.tr-ios-sdk-spm", .upToNextMajor(from: "2.4.0"))
]
```