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
    
    public func getConfigurationValue(key: String) -> String? {
        service.getConfigurationValue(key: key)
    }
    
    public func setConfigurationValue<T>(value: T, key: String) {
        service.setConfigurationValue(value: value, key: key)
    }
}
