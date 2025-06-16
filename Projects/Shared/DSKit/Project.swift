//
//  Project.swift
//  Manifests
//
//  Created by 최재혁 on 6/10/25.
//

@preconcurrency import ProjectDescription
import DependencyPlugin
import ConfigurationPlugin

let project = Project(
    name : "DSKit",
    targets: [
        .target(
            name : "CommonUI",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.Meow.DSKit.CommonUI",
            sources: ["./CommonUI/Sources/**"],
            resources: ["./CommonUI/Resources/**"],
            dependencies: [
                
            ]
        )
    ]
)
