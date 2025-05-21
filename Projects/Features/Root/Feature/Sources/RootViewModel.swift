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
    
}

public protocol RootViewModelOutput {
    
}

public protocol RootViewModelProtocol : RootViewModelInput, RootViewModelOutput { }

public class RootViewModel : RootViewModelProtocol {
    private let disposBag = DisposeBag()
    
    //Dependency
    private var i18NManager : I18NManager
    private var userDefaultManager : UserDefaultManager
    
    init(i18NManager : I18NManager, userDefaultManager : UserDefaultManager) {
        self.i18NManager = i18NManager
        self.userDefaultManager = userDefaultManager
    }
}
