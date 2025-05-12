//
//  UserConfigurationRepository.swift
//  Domain
//
//  Created by 최재혁 on 5/12/25.
//

public protocol UserConfigurationRepository {
    func getConfigurationValue(key : String) -> String?
    
    func setConfigurationValue<T>(value : T, key : String)
}
