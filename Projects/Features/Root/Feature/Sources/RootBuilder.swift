//
//  RootBuilder.swift
//  RootModule
//
//  Created by 최재혁 on 5/20/25.
//

import UIKit
import CoreUtil

import HomeFeature

public final class RootBuilder {
    public init() { }
    
    public func build() -> RootRouter {
        let viewModel = RootViewModel(i18NManager: DependencyInjector.shared.resolve(), userDefaultManager: DependencyInjector.shared.resolve())
        let navigationController = UINavigationController(rootViewController: RootViewController(viewModel: viewModel))
        let homeBuilder = HomeBuilder()
        
        let router = RootRouter(viewController: navigationController, viewModel: viewModel, homeBuilder: homeBuilder)

        return router
    }
}
