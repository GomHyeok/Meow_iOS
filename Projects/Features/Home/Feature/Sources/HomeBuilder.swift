//
//  HomeBuilder.swift
//  HomeModule
//
//  Created by 최재혁 on 6/10/25.
//

import UIKit
import CoreUtil

public final class HomeBuilder {
    public init() { }
    
    public func build() -> HomeRouter {
        let viewModel : HomeViewModelProtocol = HomeViewModel(i18Nmanager: DependencyInjector.shared.resolve())
        let viewController : HomeViewController = HomeViewController(viewModel: viewModel)
        let router : HomeRouter = HomeRouter(viewController: viewController, viewModel: viewModel as! HomeViewModel)
        
        return router
    }
}
