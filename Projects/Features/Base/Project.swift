//
//  Project.swift
//
//  Created by JaeHyeok on 2025-05-07
//

@preconcurrency import ProjectDescription
import ConfigurationPlugin
import DependencyPlugin

let project = Project(
    name: "BaseModule",
    targets: [
        // Example
        .target(
            name: "BaseFeatureExample",
            destinations: .iOS,
            product: .app,
            bundleId: "com.JaeHyeok.feature.Base.example",
            infoPlist: .example,
            sources: ["Example/Sources/**"],
            resources: ["Example/Resources/**"],
            dependencies: [
                .target(name: "BaseFeature"),
                .target(name: "BaseFeatureTesting"),
            ]
        ),


        // Tests
        .target(
            name: "BaseFeatureTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.JaeHyeok.feature.Base.tests",
            sources: ["Tests/**"],
            dependencies: [
                .target(name: "BaseFeature"),
                .target(name: "BaseFeatureTesting"),
            ]
        ),


        // Testing
        .target(
            name: "BaseFeatureTesting",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.JaeHyeok.feature.Base.testing",
            sources: ["Testing/**"],
            dependencies: [
                .target(name: "BaseFeature"),
            ]
        ),


        // Feature
        .target(
            name: "BaseFeature",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.JaeHyeok.feature.Base",
            sources: ["Feature/Sources/**"],
            resources: ["Feature/Resources/**"],
            dependencies: [
                
            ]
        ),
    ]
)
