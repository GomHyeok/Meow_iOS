//
//  RootViewController.swift
//  RootModule
//
//  Created by 최재혁 on 5/20/25.
//

import UIKit
import BaseFeature
import CoreUtil

public final class RootViewController : BaseViewController {
    private let viewModel : RootViewModelProtocol
    
    init(viewModel: RootViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init()
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public override func setupBind() {
        
        self.rx.viewDidLoad
            .bind(to: viewModel.viewDidLoad)
            .disposed(by : disposeBag)
    }
}
