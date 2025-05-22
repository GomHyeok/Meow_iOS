//
//  RootRouter.swift
//  RootModule
//
//  Created by 최재혁 on 5/20/25.
//

import Foundation
import BaseFeature
import UIKit

public protocol RootRouting : AnyObject {
    func presend(isFirst : Bool)
}

public protocol LandingListener : AnyObject {
    func didCompleteLanding()
}

public class RootRouter : Router<RootViewModel> & RootRouting {
    override init(viewController: UIViewController, viewModel: RootViewModel) {
        super.init(viewController: viewController, viewModel: viewModel)
        viewModel.router = self
    }
    
    private func attachLanding() {
        
    }
    
    private func attachHome() {
        
    }
}

extension RootRouter : LandingListener {
    public func presend(isFirst: Bool) {
        if isFirst {
            attachLanding()
        } else {
            attachHome()
        }
    }
    
    public func didCompleteLanding() {
        
    }
}
