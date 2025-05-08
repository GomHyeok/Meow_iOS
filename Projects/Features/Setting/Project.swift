//
//  Project.swift
//
//  Created by JaeHyeok on 2025-05-07
//

@preconcurrency import ProjectDescription
import ConfigurationPlugin
import DependencyPlugin

let project = Project(
    name: "SettingModule",
    targets: [
        // Example
        .target(
            name: "SettingFeatureExample",
            destinations: .iOS,
            product: .app,
            bundleId: "com.JaeHyeok.feature.Setting.example",
            infoPlist: .example,
            sources: ["Example/Sources/**"],
            resources: ["Example/Resources/**"],
            dependencies: [
                .target(name: "SettingFeature"),
                .target(name: "SettingFeatureTesting"),
            ]
        ),


        // Tests
        .target(
            name: "SettingFeatureTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.JaeHyeok.feature.Setting.tests",
            sources: ["Tests/**"],
            dependencies: [
                .target(name: "SettingFeature"),
                .target(name: "SettingFeatureTesting"),
            ]
        ),


        // Testing
        .target(
            name: "SettingFeatureTesting",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.JaeHyeok.feature.Setting.testing",
            sources: ["Testing/**"],
            dependencies: [
                .target(name: "SettingFeature"),
            ]
        ),


        // Feature
        .target(
            name: "SettingFeature",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.JaeHyeok.feature.Setting",
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
