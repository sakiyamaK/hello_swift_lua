// swift-tools-version:5.4
import PackageDescription

let package = Package(
    name: "hello_swift_lua",
    products: [
        .executable(name: "hello_swift_lua", targets: ["hello_swift_lua"]),
    ],
    dependencies: [],
    targets: [
        .executableTarget(
            name: "hello_swift_lua",
            dependencies: ["CLua"],
            path: "Sources/hello_swift_lua",
            linkerSettings: [
                .linkedLibrary("lua")
            ]
        ),
        .systemLibrary(
            name: "CLua", 
            path: "CLua"
        )
    ]
)
