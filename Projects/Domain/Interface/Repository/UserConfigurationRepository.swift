//
//  UserConfigurationRepository.swift
//  Domain
//
//  Created by 최재혁 on 5/12/25.
//

public protocol UserConfigurationRepository {
    func getLangueType(key : String) -> LanguageType?
    
    func setLangueType(value : LanguageType, key : String)
}
