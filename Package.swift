// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "CoinbasePro",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "CoinbasePro",
            targets: ["CoinbasePro"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.4.0")),
        .package(url: "https://github.com/Quick/Quick.git", .upToNextMajor(from: "3.0.0")),
        .package(url: "https://github.com/Quick/Nimble.git", .upToNextMajor(from: "9.0.0")),
        .package(url: "https://github.com/bustoutsolutions/siesta.git", .upToNextMajor(from: "1.5.0")),
        .package(url: "https://github.com/AliSoftware/OHHTTPStubs", .upToNextMajor(from: "9.1.0"))

    ],
    targets: [
        .target(
            name: "CoinbasePro",
            dependencies: ["Alamofire"],
            path: "CoinbasePro/"
        ),
        .testTarget(
            name: "CoinbaseProTests",
            dependencies: [
                "Alamofire",
                "Quick",
                "Nimble",
                "Siesta",
                "OHHTTPStubsSwift"
            ],
            path: "CoinbaseProTests/"
        )
    ],
    swiftLanguageVersions: [.v5]
)
