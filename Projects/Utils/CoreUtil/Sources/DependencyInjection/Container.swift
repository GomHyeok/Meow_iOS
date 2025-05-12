//
//  Container.swift
//  CoreUtil
//
//  Created by 최재혁 on 5/12/25.
//

import Foundation

final public class Container {
    public init() { }
    
    //생성자 저장
    private var initals : [String : () -> Any] = [:]
    
    //생성된 인스턴스 캐시
    private var dependencies : [String : Any] = [:]
    
    //인스턴스 생성자 저장 후 필요 시 생성(lazy하게)
    public func register<T>(_ instanceType : T.Type, initail : @escaping () -> T) {
        let key = String(describing: instanceType)
        //생성자 저장
        initals[key] = initail
    }
    
    public func resolve<T>() -> T {
        let key = String(describing: T.self)
        
        //인스턴스 기존에 생성시 가져옴
        if let instance = dependencies[key] as? T {
            return instance
        }
        
        //인스턴스 없는 경우 생성자 가져옴
        guard let initail = initals[key] else {
            fatalError("\(key) Dependency didn't registered")
        }
        
        //생성자 이용해서 인스턴스 생성 후 저장
        guard let instance = initail() as? T else {
            fatalError("\(key) Type mismatch.")
        }
        
        dependencies[key] = instance
        
        return instance
    }
}
