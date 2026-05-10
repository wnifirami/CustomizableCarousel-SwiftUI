// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CustomizableCarousel",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(name: "CustomizableCarousel", targets: ["CustomizableCarousel"]),
    ],
    targets: [
        .target(name: "CustomizableCarousel", path: "Sources/CustomizableCarousel"),
        .testTarget(name: "CustomizableCarouselTests", dependencies: ["CustomizableCarousel"], path: "CustomizableCarouselTests"),
    ]
)
