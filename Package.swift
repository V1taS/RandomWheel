// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "RandomWheel",
  platforms: [
    .iOS(.v13),
  ],
  products: [
    .library(
      name: "RandomWheel",
      targets: ["RandomWheel"]
    ),
  ],
  targets: [
    .target(name: "RandomWheel"),
    .testTarget(
      name: "RandomWheelTests",
      dependencies: ["RandomWheel"]
    )
  ]
)
