//
//  HomeViewController.swift
//  HomeModule
//
//  Created by 최재혁 on 5/22/25.
//

import UIKit
import RxSwift
import RxCocoa
import BaseFeature

public final class HomeViewController : BaseViewController {
    
    private let viewModel : HomeViewModelProtocol
    
    public init(viewModel : HomeViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override public func setupHierarchy() {
        
    }
    
    override public func setupBind() {
        
    }
    
    override public func setupLayout() {
        
    }
}
