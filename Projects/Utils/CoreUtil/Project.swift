//
//  Project.swift
//  Manifests
//
//  Created by 최재혁 on 5/7/25.
//

@preconcurrency import ProjectDescription
import DependencyPlugin

let project = Project(
    name : "CoreUtil",
    targets: [
        .target(
            name: "CoreUtil",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.Meow.Utils.CoreUtil",
            sources: ["Sources/**"],
            dependencies: [
                
            ]
        )
    ]
)
