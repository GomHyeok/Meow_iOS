//
//  I18NMutation.swift
//  I18N
//
//  Created by 최재혁 on 5/12/25.
//

import DomainInterface

public struct I18NMutation {
    public var languageType : LanguageType?
    
    public init(languageType : LanguageType? = nil) {
        self.languageType = languageType
    }
}
