//
//  DefualtI18NManager.swift
//  I18N
//
//  Created by 최재혁 on 5/13/25.
//

import Foundation
import RxSwift
import DomainInterface
import CoreUtil

public final class DefaultI18NManager : I18NManager {
    
    @Injected private var repository : UserConfigurationRepository
    
    private let changSubject : PublishSubject<I18NMutation> = .init()
    
    public init() { }
    
    public func getChangeSubject() -> Observable<I18NMutation> {
        self.changSubject
    }
    
    public func setLanguageType(type: LanguageType) {
        repository.setLangueType(value: type, key: UserDefaultKey.languageType.rawValue)
        changSubject.onNext(.init(languageType: type))
    }
    
    public func getLangugeType() -> LanguageType {
        guard let type = repository.getLangueType(key: UserDefaultKey.languageType.rawValue) else {
            return LanguageType.korean
        }
        
        return type
    }
}
