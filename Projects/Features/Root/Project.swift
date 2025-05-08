//
//  Project.swift
//
//  Created by JaeHyeok on 2025-05-07
//

@preconcurrency import ProjectDescription
import ConfigurationPlugin
import DependencyPlugin

let project = Project(
    name: "RootModule",
    targets: [
        // Example
        .target(
            name: "RootFeatureExample",
            destinations: .iOS,
            product: .app,
            bundleId: "com.JaeHyeok.feature.Root.example",
            infoPlist: .example,
            sources: ["Example/Sources/**"],
            resources: ["Example/Resources/**"],
            dependencies: [
                .target(name: "RootFeature"),
                .target(name: "RootFeatureTesting"),
            ]
        ),


        // Tests
        .target(
            name: "RootFeatureTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.JaeHyeok.feature.Root.tests",
            sources: ["Tests/**"],
            dependencies: [
                .target(name: "RootFeature"),
                .target(name: "RootFeatureTesting"),
            ]
        ),


        // Testing
        .target(
            name: "RootFeatureTesting",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.JaeHyeok.feature.Root.testing",
            sources: ["Testing/**"],
            dependencies: [
                .target(name: "RootFeature"),
            ]
        ),


        // Feature
        .target(
            name: "RootFeature",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.JaeHyeok.feature.Root",
            sources: ["Feature/Sources/**"],
            resources: ["Feature/Resources/**"],
            dependencies: [
                ModuleDependency.Util.CoreUtil,
            ]
        ),
    ]
)
