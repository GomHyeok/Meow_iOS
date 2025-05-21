//
//  RootViewController.swift
//  RootModule
//
//  Created by 최재혁 on 5/20/25.
//

import UIKit
import BaseFeature

public final class RootViewController : BaseViewController {
    private let viewModel : RootViewModelProtocol
    
    init(viewModel: RootViewModelProtocol) {
        self.viewModel = viewModel
        super.init()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func setupViewProperty() {
        
    }
    
    public override func setupHierarchy() {
        
    }
    
    public override func setupBind() {
        
    }
    
    public override func setupDelegate() {
        
    }
}
