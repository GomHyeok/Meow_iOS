//
//  BaseViewController.swift
//  BaseModule
//
//  Created by 최재혁 on 5/19/25.
//

import Foundation
import RxSwift
import UIKit

public protocol BaseViewItemProtocol : AnyObject {
    // view property 설정
    func setupViewProperty()
    
    func setupHierarchy()
    
    func setupLayout()
}

public protocol BaseViewControllerProtocol : AnyObject, BaseViewItemProtocol {
    func setupDelegate()
    
    func setupBind()
}

open class BaseViewController : UIViewController, BaseViewControllerProtocol {
    public private(set) var disposeBag = DisposeBag()
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        
        setupViewProperty()
        setupDelegate()
        setupHierarchy()
        setupLayout()
        setupBind()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
    
    open func setupViewProperty() { }
    open func setupDelegate() { }
    open func setupHierarchy() { }
    open func setupLayout() { }
    open func setupBind () { }
}
