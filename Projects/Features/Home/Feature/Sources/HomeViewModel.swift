//
//  HomeViewModel.swift
//  HomeModule
//
//  Created by 최재혁 on 5/22/25.
//

import Foundation
import RxCocoa
import RxSwift
import I18N

public protocol HomeViewModelInput {
    
}

public protocol HomeViewModelOutput {
    
}

public protocol HomeViewModelProtocol : HomeViewModelInput, HomeViewModelOutput{
    
}

public class HomeViewModel : HomeViewModelProtocol {
    
    private let disposeBag : DisposeBag = .init()
    private let i18Nmanager : I18NManager
    
    weak var router : HomeRouter?
    
    init(i18Nmanager : I18NManager) {
        self.i18Nmanager = i18Nmanager
        
        
    }
}
