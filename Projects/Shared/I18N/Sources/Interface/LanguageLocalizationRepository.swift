//
//  LanguageLocalizationRepository.swift
//  I18N
//
//  Created by 최재혁 on 5/13/25.
//

public protocol LanguageLocalizationRepository {
    func getString(key : String, lanCode : String) -> String
}
