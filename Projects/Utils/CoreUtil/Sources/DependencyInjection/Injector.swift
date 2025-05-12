//
//  Injector.swift
//  CoreUtil
//
//  Created by 최재혁 on 5/12/25.
//

import Foundation

@propertyWrapper
public final class Injected<T> {
    public let wrappedValue : T
    
    public init() {
        self.wrappedValue = DependencyInjector.shared.resolve()
    }
}

public protocol DependencyAssembly {
    func assemble(container : Container)
}

public protocol DependencyAssemblable {
    func register<T>(_ instanceType : T.Type, initail : @escaping () -> T)
    func assemble(_ assemblyList : [DependencyAssembly])
}

public protocol DependencyResolvable {
    func resolve<T>() -> T
}

typealias Injector = DependencyAssemblable & DependencyResolvable

public final class DependencyInjector : Injector {
    
    public static let shared : DependencyInjector = .init()
    
    private let container : Container
    
    private init(container : Container = Container()) {
        self.container = container
    }
    
    //test시 assembly 이용하지 않고 container에 직접 등록하기 위해 사용
    public func register<T>(_ instanceType: T.Type, initail: @escaping () -> T) {
        container.register(instanceType) { initail() }
    }
    
    public func resolve<T>() -> T {
        container.resolve()
    }
    
    public func assemble(_ assemblyList: [any DependencyAssembly]) {
        assemblyList.forEach{ $0.assemble(container: container) }
    }
}
