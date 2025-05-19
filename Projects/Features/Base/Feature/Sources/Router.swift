//
//  Router.swift
//  BaseModule
//
//  Created by 최재혁 on 5/19/25.
//

import UIKit

public protocol Routable : AnyObject {
    associatedtype ViewModel
}

public class Router<ViewModel> : Routable {
    
    public let viewController : UIViewController
    public let viewModel : ViewModel
    
    private var children : [any Routable] = []
    
    public init(viewController : UIViewController, viewModel : ViewModel) {
        self.viewController = viewController
        self.viewModel = viewModel
    }
    
    public func addRoutable(router : any Routable) {
        children.append(router)
    }
    
    public func deleteRoutable(router : any Routable) {
        let childIndex = children.firstIndex(where: { $0 === router })
        
        if let childIndex {
            children.remove(at: childIndex)
        }
    }
}
