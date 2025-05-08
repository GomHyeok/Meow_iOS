//
//  Project.swift
//
//  Created by JaeHyeok on 2025-05-07
//

@preconcurrency import ProjectDescription
import ConfigurationPlugin
import DependencyPlugin

let project = Project(
    name: "ShopModule",
    targets: [
        // Example
        .target(
            name: "ShopFeatureExample",
            destinations: .iOS,
            product: .app,
            bundleId: "com.JaeHyeok.feature.Shop.example",
            infoPlist: .example,
            sources: ["Example/Sources/**"],
            resources: ["Example/Resources/**"],
            dependencies: [
                .target(name: "ShopFeature"),
                .target(name: "ShopFeatureTesting"),
            ]
        ),


        // Tests
        .target(
            name: "ShopFeatureTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.JaeHyeok.feature.Shop.tests",
            sources: ["Tests/**"],
            dependencies: [
                .target(name: "ShopFeature"),
                .target(name: "ShopFeatureTesting"),
            ]
        ),


        // Testing
        .target(
            name: "ShopFeatureTesting",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.JaeHyeok.feature.Shop.testing",
            sources: ["Testing/**"],
            dependencies: [
                .target(name: "ShopFeature"),
            ]
        ),


        // Feature
        .target(
            name: "ShopFeature",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.JaeHyeok.feature.Shop",
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
