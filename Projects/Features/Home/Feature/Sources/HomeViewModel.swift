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
import DomainInterface

public protocol HomeViewModelInput {
    var viewDidLoad : PublishSubject<Void> { get }
}

public protocol HomeViewModelOutput {
    var updateStaticUI : Driver<HomeStaicRenderObject> { get }
}

public protocol HomeViewModelProtocol : HomeViewModelInput, HomeViewModelOutput{
    
}

public class HomeViewModel : HomeViewModelProtocol {
    
    private let disposeBag : DisposeBag = .init()
    private let languageRepository : LanguageLocalizationRepository
    private let i18Nmanager : I18NManager
    private let i18NSubject : Observable<I18NMutation>
    
    weak var router : HomeRouter?
    
    init(i18Nmanager : I18NManager, languageRepository : LanguageLocalizationRepository ) {
        self.i18Nmanager = i18Nmanager
        self.languageRepository = languageRepository
        self.viewDidLoad = .init()
        
        i18NSubject = i18Nmanager.getChangeSubject()
        
        self.updateStaticUI = viewDidLoad
            .map { _ in
                let lanType = i18Nmanager.getLangugeType()
                let shop = languageRepository.getString(key: LanguageKey.shop.rawValue, lanCode: lanType.code)
                let setting = languageRepository.getString(key: LanguageKey.setting.rawValue, lanCode: lanType.code)
                let talk = languageRepository.getString(key: LanguageKey.talk.rawValue, lanCode: lanType.code)
                let affection = languageRepository.getString(key: LanguageKey.affection.rawValue, lanCode: lanType.code)
                return HomeStaicRenderObject(shop: shop, setting: setting, talk: talk, affection: affection)
            }
            .asDriver(onErrorDriveWith: .empty())
        
        self.updateStaticUI = i18NSubject
            .map { mutation in
                let lanType = mutation.languageType
                let shop = languageRepository.getString(key: LanguageKey.shop.rawValue, lanCode: lanType.code)
                let setting = languageRepository.getString(key: LanguageKey.setting.rawValue, lanCode: lanType.code)
                let talk = languageRepository.getString(key: LanguageKey.talk.rawValue, lanCode: lanType.code)
                let affection = languageRepository.getString(key: LanguageKey.affection.rawValue, lanCode: lanType.code)
                return HomeStaicRenderObject(shop: shop, setting: setting, talk: talk, affection: affection)
            }
            .asDriver(onErrorDriveWith: .empty())
    }
    
    public let viewDidLoad: PublishSubject<Void>
    
    public var updateStaticUI : Driver<HomeStaicRenderObject>
}

