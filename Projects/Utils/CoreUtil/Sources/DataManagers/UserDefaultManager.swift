//
//  UserDefaultManager.swift
//  CoreUtil
//
//  Created by 최재혁 on 5/12/25.
//

import Foundation

public final class UserDefaultManager {
    private let userDefaults: UserDefaults = .standard
    
    public func setUserDefault<T>(value: T, key: String) {
        userDefaults.set(value, forKey: key)
    }
    
    public func getUserDefault(key: String) -> String? {
        return userDefaults.string(forKey: key)
    }
    
    public func removeUserDefault(forKey key: String) {
        userDefaults.removeObject(forKey: key)
    }
}
