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

        .binaryTarget(
            name: "Libnfs",
            url: "https://github.com/mpvkit/libnfs-build/releases/download/5.0.3/Libnfs.xcframework.zip",
            checksum: "e0f74c6f1242d909a7ccb81b628a5b9d9446b7c93a40b6b64330f46c165c6710"
        ),
        //AUTO_GENERATE_TARGETS_END//
    ]
)
