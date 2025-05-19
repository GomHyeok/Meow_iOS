//
//  Project.swift
//  Manifests
//
//  Created by 최재혁 on 5/8/25.
//

@preconcurrency import ProjectDescription
import DependencyPlugin
import ConfigurationPlugin

let project = Project(
    name : "App",
    options: .options(
        
    ),
    targets: [
        .target(
            name: "Meow",
            destinations: .iOS,
            product: .app,
            bundleId : "io.tuist.Meow",
            infoPlist: .app,
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                ModuleDependency.Feature.RootFeature,
                
                ModuleDependency.Util.CoreUtil,
                
                ModuleDependency.Shared.I18N,
                
                ModuleDependency.Domain.interface
            ],
            settings: .settings(
                base:[:],
                configurations: [
                    .debug(
                        name: "Debug",
                        xcconfig: .relativeToRoot("Secrets/xcconfigs/Debug.xcconfig")
                    ),
                    .release(
                        name: "Release",
                        xcconfig: .relativeToRoot("Secrets/xcconfigs/Release.xcconfig")
                    )
                ]
            )
        )
    ]
)
