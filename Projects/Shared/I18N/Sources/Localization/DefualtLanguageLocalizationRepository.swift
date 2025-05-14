//
//  DefualtLanguageLocalizationRepository.swift
//  I18N
//
//  Created by 최재혁 on 5/13/25.
//

import Foundation

public class DefualtLanguageLocalizationRepository : LanguageLocalizationRepository {
    
    private let localizableTextData : [String : [String : String]]
    
    public init() {
        guard let url = I18NResources.bundle.url(forResource : "Localizable", withExtension: "json") else {
            fatalError("Localizable.json not found")
        }
        
        do {
            let jsonData = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode([String : [String : String]].self, from : jsonData)
            self.localizableTextData = decodedData
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    public func getString(key: String, lanCode: String) -> String {
        localizableTextData[key]![lanCode]!
    }
}
