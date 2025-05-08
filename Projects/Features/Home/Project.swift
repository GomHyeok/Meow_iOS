//
//  Project.swift
//
//  Created by Jae Hyeok on 2025-05-07
@preconcurrency import ProjectDescription
import ConfigurationPlugin
import DependencyPlugin

let project = Project(
    name: "HomeModule",
    targets: [
        // Example
        .target(
            name: "HomeFeatureExample",
            destinations: .iOS,
            product: .app,
            bundleId: "com.JaeHyeok.feature.Home.example",
            infoPlist: .example,
            sources: ["Example/Sources/**"],
            resources: ["Example/Resources/**"],
            dependencies: [
                .target(name: "HomeFeature"),
                .target(name: "HomeFeatureTesting"),
            ]
        ),


        // Tests
        .target(
            name: "HomeFeatureTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.JaeHyeok.feature.Home.tests",
            sources: ["Tests/**"],
            dependencies: [
                .target(name: "HomeFeature"),
                .target(name: "HomeFeatureTesting"),
            ]
        ),


        // Testing
        .target(
            name: "HomeFeatureTesting",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.JaeHyeok.feature.Home.testing",
            sources: ["Testing/**"],
            dependencies: [
                .target(name: "HomeFeature"),
            ]
        ),


        // Feature
        .target(
            name: "HomeFeature",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.JaeHyeok.feature.Home",
            sources: ["Feature/Sources/**"],
            resources: ["Feature/Resources/**"],
            dependencies: [
                ModuleDependency.Domain.interface,
                ModuleDependency.Shared.I18N,
                ModuleDependency.Util.CoreUtil
            ]
        ),
    ]
)
