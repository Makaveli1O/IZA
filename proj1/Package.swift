// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "proj1",
    products: [
        .executable(name: "proj1", targets: ["proj1"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),

    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "proj1",
            dependencies: ["Simulator"]),
        .target(
            name: "Simulator",
            dependencies: ["FiniteAutomata"]),
        .target(
            name: "MyFiniteAutomatas",
            dependencies: ["FiniteAutomata"]),
        .target(
            name: "FiniteAutomata",
            dependencies: []),
        .testTarget(
            name: "proj1Tests",
            dependencies: ["proj1", "MyFiniteAutomatas"]),
    ]
)
