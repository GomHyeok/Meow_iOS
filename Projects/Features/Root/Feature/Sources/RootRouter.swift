//
//  RootRouter.swift
//  RootModule
//
//  Created by 최재혁 on 5/20/25.
//

import Foundation
import BaseFeature
import HomeFeature
import UIKit

public protocol RootRouting : AnyObject {
    func present(isFirst : Bool)
}

public protocol LandingListener : AnyObject {
    func didCompleteLanding()
}

public class RootRouter : Router<RootViewModel> & RootRouting {
    
    // Builder
    let homeBuilder : HomeBuilder
    
    // Router
    var homeRouter : HomeRouter?
    
    init(viewController: UIViewController, viewModel: RootViewModel, homeBuilder : HomeBuilder) {
        self.homeBuilder = homeBuilder
        
        super.init(viewController: viewController, viewModel: viewModel)
        viewModel.router = self
    }
    
    private func attachLanding() {
        
    }
    
    private func attachHome() {
        if let homeRouter = homeRouter {
            if let navigationController = viewController as? UINavigationController {
                navigationController.isNavigationBarHidden = true
                navigationController.pushViewController(homeRouter.viewController, animated: true)
            }
            return
        }
        
        let router = homeBuilder.build()
        self.homeRouter = router
        self.addRoutable(router: router)
        
        if let navigationController = viewController as? UINavigationController {
            navigationController.isNavigationBarHidden = true
            navigationController.pushViewController(router.viewController, animated: true)
        }
    }
}

extension RootRouter : LandingListener {
    public func present(isFirst: Bool) {
        if isFirst {
            attachLanding()
        } else {
            attachHome()
        }
    }
    
    public func didCompleteLanding() {
        
    }
}
