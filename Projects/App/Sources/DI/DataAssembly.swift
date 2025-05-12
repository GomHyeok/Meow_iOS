//
//  DataAssembly.swift
//  Meow
//
//  Created by 최재혁 on 5/12/25.
//

import CoreUtil
import DataSource
import DomainInterface
import Repository

public final class DataAssembly : DependencyAssembly {
    public func assemble(container: Container) {
        container.register(UserConfigurationService.self) {
            DefaultUserConfigurationService()
        }
        
        container.register(UserConfigurationRepository.self) {
            DefaultUserConfigurationRepository()
        }
    }
}

