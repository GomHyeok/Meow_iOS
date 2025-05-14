//
//  DefaultUserConfigurationRepository.swift
//  Data
//
//  Created by 최재혁 on 5/12/25.
//

import DomainInterface
import CoreUtil
import DataSource

public final class DefaultUserConfigurationRepository : UserConfigurationRepository {
    
    @Injected private var service : UserConfigurationService
    
    public init() { }
    
    public func getLangueType(key: String) -> LanguageType? {
        guard let value = service.getConfigurationValue(key: key) else {
            return LanguageType.korean
        }
        
        return .init(rawValue: value)
    }
    
    public func setLangueType(value: LanguageType, key: String) {
        service.setConfigurationValue(value: value.savingValue, key: key)
    }
}
