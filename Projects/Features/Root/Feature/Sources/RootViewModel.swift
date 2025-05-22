//
//  RootViewModel.swift
//  RootModule
//
//  Created by 최재혁 on 5/20/25.
//

import RxSwift
import I18N
import CoreUtil
import RxCocoa
import UIKit
import DomainInterface

public protocol RootViewModelInput {
    var viewDidLoad : PublishSubject<Void> { get }
}

public protocol RootViewModelOutput {
    
}

public protocol RootViewModelProtocol : RootViewModelInput, RootViewModelOutput {
    
}

public class RootViewModel : RootViewModelProtocol {
    private let disposBag = DisposeBag()
    
    //Dependency
    private var i18NManager : I18NManager
    private var userDefaultManager : UserDefaultManager
    
    weak var router: RootRouting!
    
    init(i18NManager : I18NManager, userDefaultManager : UserDefaultManager) {
        self.i18NManager = i18NManager
        self.userDefaultManager = userDefaultManager
        
        self.viewDidLoad = .init()
        
        self.viewDidLoad
            .subscribe({[weak self] _ in
                guard let self = self else { return }
                guard (self.userDefaultManager.getUserDefault(key: UserDefaultKey.catName.rawValue)) != nil else {
                    self.router?.presend(isFirst: false)
                    return
                }
                
                self.router?.presend(isFirst: true)
            })
            .disposed(by: disposBag)
    }
    
    public var viewDidLoad: PublishSubject<Void>
}
