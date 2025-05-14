//
//  SharedAssembly.swift
//  Meow
//
//  Created by 최재혁 on 5/12/25.
//

import I18N
import CoreUtil

public final class SharedAssembly : DependencyAssembly {
    public func assemble(container: Container) {
        container.register(I18NManager.self) {
            DefaultI18NManager()
        }
        
        container.register(LanguageLocalizationRepository.self) {
            DefualtLanguageLocalizationRepository()
        }
    }
}
