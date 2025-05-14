//
//  MockUserConfigurationRepository.swift
//  I18N
//
//  Created by 최재혁 on 5/14/25.
//

import Foundation
import DomainInterface

public final class MockUserConfigurationRepository : UserConfigurationRepository {
    
    public init(){  }
    
    private var mockUserDefault : [String : String] = [
        UserDefaultKey.languageType.rawValue : LanguageType.korean.savingValue
    ]
    
    public func getLangueType(key: String) -> LanguageType? {
        guard let value = mockUserDefault[key] else {
            return nil
        }
        
        return .init(rawValue: value)
    }
    
    public func setLangueType(value: LanguageType, key: String) {
        mockUserDefault[key] = value.rawValue
    }
}
