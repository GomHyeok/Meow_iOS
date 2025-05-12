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

public final class DependencyInjector : DependencyAssemblable, DependencyResolvable {
    
    public static let shared : DependencyInjector = .init()
    
    private let container : Container
    
    private init(container : Container = Container()) {
        self.container = container
    }
    
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
