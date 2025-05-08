//
//  Project.swift
//  Manifests
//
//  Created by 최재혁 on 5/7/25.
//

@preconcurrency import ProjectDescription
import DependencyPlugin

let project = Project(
    name: "Data",
    targets: [
        .target(
            name: "Repository",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "com.Meow.Data.repository",
            sources: ["Repository/Sources/**"],
            resources: ["Repository/Resources/**"],
            dependencies: [
                ModuleDependency.Domain.interface,
                ModuleDependency.Data.dataSource
            ]
        ),
        
        .target(
            name: "DataSource",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "com.Meow.Data.DataSource",
            sources: ["DataSource/Sources/**"],
            resources: ["DataSource/Resources/**"],
            dependencies: [
                ModuleDependency.Util.CoreUtil,
                ModuleDependency.ThirdParty.Moya,
                ModuleDependency.ThirdParty.RxSwift,
                ModuleDependency.ThirdParty.RxCocoa,
                ModuleDependency.ThirdParty.RxDataSources
            ]
        ),
    
        .target(
            name: "DataTest",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "com.Meow.Data.DataTest",
            sources: ["DataTest/Sources/**"],
            resources: ["DataTest/Resources/**"],
            dependencies: [
                .target(name: "Repository"),
                .target(name: "DataSource")
            ]
        )
    ]
)
