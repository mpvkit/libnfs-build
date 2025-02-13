import Foundation

do {
    let options = try ArgumentOptions.parse(CommandLine.arguments)
    try Build.performCommand(options)

    try BuildNFS().buildALL()
} catch {
    print("ERROR: \(error.localizedDescription)")
    exit(1)
}


enum Library: String, CaseIterable {
    case libnfs
    var version: String {
        switch self {
        case .libnfs:
            return "libnfs-5.0.3"
        }
    }

    var url: String {
        switch self {
        case .libnfs:
            return "https://github.com/sahlberg/libnfs"
        }
    }

    // for generate Package.swift
    var targets : [PackageTarget] {
        switch self {
        case .libnfs:
            return  [
                .target(
                    name: "Libnfs",
                    url: "https://github.com/mpvkit/libnfs-build/releases/download/\(BaseBuild.options.releaseVersion)/Libnfs.xcframework.zip",
                    checksum: "https://github.com/mpvkit/libnfs-build/releases/download/\(BaseBuild.options.releaseVersion)/Libnfs.xcframework.checksum.txt"
                ),
            ]
        }
    }
}


private class BuildNFS: BaseBuild {
    init() {
        super.init(library: .libnfs)
    }
}

