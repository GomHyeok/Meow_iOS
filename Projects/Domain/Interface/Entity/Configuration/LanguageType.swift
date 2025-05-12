//
//  LanguageType.swift
//  Domain
//
//  Created by 최재혁 on 5/12/25.
//

public enum LanguageType : String {
    case korean = "KOR"
    case english = "ENG"
    
    public var savingValue : String {
        self.rawValue
    }
}
