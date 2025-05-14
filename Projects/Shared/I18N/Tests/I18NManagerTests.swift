//
//  ㅑ1.swift
//  I18N
//
//  Created by 최재혁 on 5/14/25.
//

import XCTest
import RxSwift
import CoreUtil

@testable import I18N
@testable import I18NTesting

import DomainInterface
import Testing

struct DefaultI18ManagerTests{
    
    private var manager: I18NManager
    private var repository : LanguageLocalizationRepository!
    private var disposeBag : DisposeBag!
    
    
    init() {
        DependencyInjector.shared.register(UserConfigurationRepository.self) { MockUserConfigurationRepository()}
        
        DependencyInjector.shared
            .register(I18NManager.self) {
                DefaultI18NManager()
            }
        
        manager = DependencyInjector.shared.resolve()
        disposeBag = DisposeBag()
        repository = DefualtLanguageLocalizationRepository()
    }
    
    @Test
    func testSetLanguage() {
        let subject = manager.getChangeSubject()
        
        subject
            .subscribe(onNext: {mutation in
                #expect(mutation != nil)
                #expect(mutation.languageType == LanguageType.english)
            })
            .disposed(by: disposeBag)
        
        manager.setLanguageType(type: .init(rawValue: "ENG")!)
    }
    
    @Test
    func testGetLanguage() {
        manager.setLanguageType(type: .init(rawValue: "ENG")!)
        
        var type = manager.getLangugeType()
        
        #expect(type != nil)
        #expect(type == LanguageType.english)
        
        manager.setLanguageType(type: .init(rawValue: "KOR")!)
        
        type = manager.getLangugeType()
        
        #expect(type != nil)
        #expect(type == LanguageType.korean)
        
        let st = repository.getString(key: LanguageKey.title.rawValue, lanCode: type.code)
        
        #expect(st == "야옹")
    }
}
