//
//  Dependency.swift
//  Plugins
//
//  Created by 최재혁 on 5/5/25.
//

@preconcurrency import ProjectDescription

public enum ModuleDependency {
    public enum App {
        
    }
    
    public enum Domain {
        public static let interface : TargetDependency = .project(target: "DomainInterface", path: .relativeToRoot("Projects/Domain"))
        
        public static let concrete : TargetDependency = .project(target: "concrete", path: .relativeToRoot("Projects/Domain"))
    }
    
    public enum Data {
        public static let repository : TargetDependency = .project(target: "Repository", path: .relativeToRoot("Projects/Data"))
        
        public static let dataSource : TargetDependency = .project(target: "DataSource", path: .relativeToRoot("Projects/Data"))
    }
    
    public enum Feature {
        public static let BaseFeature : TargetDependency = .project(target: "BaseFeature", path: .relativeToRoot("Projects/Features/Base"))
        
        public static let RootFeature : TargetDependency = .project(target: "RootFeature", path: .relativeToRoot("Projects/Features/Root"))
        
        public static let HomeFeature : TargetDependency = .project(target: "HomeFeature", path: .relativeToRoot("Projects/Features/Home"))
        
        public static let ShopFeature : TargetDependency = .project(target: "ShopFeature", path: .relativeToRoot("Projects/Features/Shop"))
        
        public static let SettingFeature : TargetDependency = .project(target: "SettingFeature", path: .relativeToRoot("Projects/Features/Setting"))
        
        public static let UserFeature : TargetDependency = .project(target: "UserFeature", path: .relativeToRoot("Projects/Features/User"))
    }
    
    public enum Shared {
        public static let CommonUI : TargetDependency = .project(target: "CommonUI", path: .relativeToRoot("Projects/Shared/DSKit"))
        
        public static let I18N : TargetDependency = .project(target: "I18N", path: .relativeToRoot("Projects/Shared/I18N"))
    }
    
    public enum Util {
        public static let CoreUtil : TargetDependency = .project(target: "CoreUtil", path: .relativeToRoot("Projects/Utils/CoreUtil"))
    }
    
    public enum ThirdParty {
        public static let RxSwift : TargetDependency = .external(name: "RxSwift")
        public static let RxCocoa : TargetDependency = .external(name: "RxCocoa")
        public static let RxDataSources : TargetDependency = .external(name: "RxDataSources")
        public static let Moya : TargetDependency = .external(name: "Moya")
    }
}
