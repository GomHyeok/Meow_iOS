//
//  Project.swift
//  Manifests
//
//  Created by 최재혁 on 5/7/25.
//

@preconcurrency import ProjectDescription
import DependencyPlugin

let project = Project(
    name: "Domain",
    targets: [
        
        .target(
            name: "DomainTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.Meow.Domain.tests",
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [
                .target(name: "Domain"),
                .target(name: "DomainTesting"),
            ]
        ),
        
        
        .target(
            name: "Domain",
            destinations: .iOS,
            product: .staticLibrary,
            bundleId: "com.Meow.Domain",
            sources: ["Concrete/**"],
            dependencies: [
                .target(name: "DomainInterface"),
                ModuleDependency.Shared.I18N,
            ]
        ),
        
        
        .target(
            name: "DomainInterface",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.Meow.Domain.interface",
            sources: ["Interface/**"],
            dependencies: [
            ]
        ),
        
        
        .target(
            name: "DomainTesting",
            destinations: .iOS,
            product: .staticLibrary,
            bundleId: "com.Meow.Domain.testing",
            sources: ["Testing/**"],
            dependencies: [
                .target(name: "Domain"),
                .target(name: "DomainInterface"),
            ]
        ),
        
    ]
)
