//
//  Project.swift
//
//  Created by JaeHyeok on 2025-05-07
//

@preconcurrency import ProjectDescription
import ConfigurationPlugin
import DependencyPlugin

let project = Project(
    name: "UserModule",
    targets: [
        // Example
        .target(
            name: "UserFeatureExample",
            destinations: .iOS,
            product: .app,
            bundleId: "com.JaeHyeok.feature.User.example",
            infoPlist: .example,
            sources: ["Example/Sources/**"],
            resources: ["Example/Resources/**"],
            dependencies: [
                .target(name: "UserFeature"),
                .target(name: "UserFeatureTesting"),
            ]
        ),


        // Tests
        .target(
            name: "UserFeatureTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.JaeHyeok.feature.User.tests",
            sources: ["Tests/**"],
            dependencies: [
                .target(name: "UserFeature"),
                .target(name: "UserFeatureTesting"),
            ]
        ),


        // Testing
        .target(
            name: "UserFeatureTesting",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.JaeHyeok.feature.User.testing",
            sources: ["Testing/**"],
            dependencies: [
                .target(name: "UserFeature"),
            ]
        ),


        // Feature
        .target(
            name: "UserFeature",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.JaeHyeok.feature.User",
            sources: ["Feature/Sources/**"],
            resources: ["Feature/Resources/**"],
            dependencies: [
                ModuleDependency.Domain.interface,
                ModuleDependency.Shared.I18N,
                ModuleDependency.Util.CoreUtil,
            ]
        ),
    ]
)
