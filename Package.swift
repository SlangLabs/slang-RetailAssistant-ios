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
            url: "https://iosbinary.s3.ap-south-1.amazonaws.com/slang_retail_assistant/4.0.0/slang_retail_assistant.xcframework.zip",
            checksum: "db2e1ae16bc501eab817d953167402b7790728cb21b330be0d8e70c7c532b85f"
        )
    ]
)
