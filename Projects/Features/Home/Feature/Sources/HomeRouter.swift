//
//  HomeRouter.swift
//  HomeModule
//
//  Created by 최재혁 on 5/22/25.
//

import UIKit
import BaseFeature

public protocol HomeRouting : AnyObject {
    
}

public protocol PresentListener : AnyObject {
    func presentViewController(destination : HomeDestination)
}

public class HomeRouter : Router<HomeViewModel> & HomeRouting {
    override public init(viewController: UIViewController, viewModel: HomeViewModel) {
        super.init(viewController: viewController, viewModel: viewModel)
        viewModel.router = self
    }
    
    private func attachSetting() {
        
    }
    
    private func attachShop() {
        
    }

    private func attachChat() {
        
    }
}

extension HomeRouter : PresentListener {
    public func presentViewController(destination : HomeDestination) {
        switch destination {
        case .setting :
            attachSetting()
        case .shop :
            attachShop()
        case .chat :
            attachChat()
        }
    }
}
