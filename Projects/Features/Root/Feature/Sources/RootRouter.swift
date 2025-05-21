//
//  RootRouter.swift
//  RootModule
//
//  Created by 최재혁 on 5/20/25.
//

import Foundation
import BaseFeature
import UIKit

public protocol RootRouting {
    func presend(isFirst : Bool)
    
}

public class RootRouter : Router<RootViewModelProtocol> & RootRouting {
    override init(viewController: UIViewController, viewModel: any RootViewModelProtocol) {
        super.init(viewController: viewController, viewModel: viewModel)
    }
}

extension RootRouter {
    public func presend(isFirst: Bool) {
        if isFirst {
            
        } else {
            
        }
    }
}
