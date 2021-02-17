// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SlangRetailAssitant",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "SlangRetailAssitant",
            targets: ["slang_retail_assistant", "SwiftProtobuf"]),
    ],
    targets: [
        .binaryTarget(
            name: "SwiftProtobuf",
            url: "https://iosbinary.s3.ap-south-1.amazonaws.com/SwiftProtobuf/1.13.0/SwiftProtobuf.xcframework.zip",
            checksum: "11c75082c4659427242226509bc55a7189be108e7c1c06533c4af9e53834ebf0"
        ),
        .binaryTarget(
            name: "slang_retail_assistant",
            url: "https://iosbinary.s3.ap-south-1.amazonaws.com/slang_retail_assistant/1.0.0/slang_retail_assistant.xcframework.zip",
            checksum: "67fec55e12b37c2f02300afe54a62046ef511eb88e57099e4339df4320cce9a3"
        )
    ]
)
