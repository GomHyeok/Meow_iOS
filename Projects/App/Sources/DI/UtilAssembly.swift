//
//  UtilAssembly.swift
//  Meow
//
//  Created by 최재혁 on 5/12/25.
//

import CoreUtil

public final class UtilAssembly : DependencyAssembly {
    public func assemble(container: Container) {
        container.register(UserDefaultManager.self) {
            DefaultUserDefaultManager()
        }
    }
}
