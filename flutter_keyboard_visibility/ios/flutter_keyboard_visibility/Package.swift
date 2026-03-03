// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "flutter_keyboard_visibility",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "flutter-keyboard-visibility", targets: ["flutter_keyboard_visibility"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "flutter_keyboard_visibility",
            dependencies: []
        )
    ]
)
