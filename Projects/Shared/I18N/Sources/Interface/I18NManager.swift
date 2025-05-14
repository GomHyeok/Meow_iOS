//
//  I18NManager.swift
//  I18N
//
//  Created by 최재혁 on 5/13/25.
//

import Foundation
import RxSwift
import DomainInterface

public protocol I18NManager {
    func getChangeSubject() -> Observable<I18NMutation>
    
    func setLanguageType(type : LanguageType)
    
    func getLangugeType() -> LanguageType
}
