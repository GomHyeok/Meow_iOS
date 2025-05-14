//
//  UserConfigurationService.swift
//  Data
//
//  Created by 최재혁 on 5/12/25.
//

import Foundation
import CoreUtil

public protocol UserConfigurationService {
    
    func getConfigurationValue(key : String) -> String?
    
    func setConfigurationValue<T>(value : T, key : String)
}

public class DefaultUserConfigurationService : UserConfigurationService {
    
    @Injected private var manager : UserDefaultManager
    
    public init() { }
    
    public func getConfigurationValue(key: String) -> String? {
        manager.getUserDefault(key: key)
    }
    
    public func setConfigurationValue<T>(value: T, key: String) {
        manager.setUserDefault(value: value, key: key)
    }
}
