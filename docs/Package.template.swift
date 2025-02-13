// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "libnfs",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13)],
    products: [
        .library(
            name: "libnfs",
            targets: ["libnfs"]
        ),
    ],
    targets: [
        // Need a dummy target to embedded correctly.
        // https://github.com/apple/swift-package-manager/issues/6069
        .target(
            name: "libnfs",
            dependencies: ["Libnfs"],
            path: "Sources/Libnfs"
        ),
        //AUTO_GENERATE_TARGETS_BEGIN//
        //AUTO_GENERATE_TARGETS_END//
    ]
)
