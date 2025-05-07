@preconcurrency import ProjectDescription

nonisolated(unsafe) let project = Project(
    name: "Meow",
    targets: [
        .target(
            name: "Meow",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.Meow",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
                ]
            ),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: []
        ),
        .target(
            name: "MeowTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.MeowTests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [.target(name: "Meow")]
        ),
    ]
)
