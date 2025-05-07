//
//  InfoPlist.swift
//  Plugins
//
//  Created by 최재혁 on 5/5/25.
//

@preconcurrency import ProjectDescription

public extension InfoPlist {
    static let app : InfoPlist = .makeAppPlist(with: [:])
    static let example : InfoPlist = .makeAppPlist(with: [:])
}

//configuration 활용 필요
extension InfoPlist {
    public static func makeAppPlist(with : [String : Plist.Value]) -> InfoPlist {
        var result : [String : Plist.Value] = [
            "NSAppTransportSecurity" : [
                "NSAllowsArbitraryLoads" : true
            ],
            "UILaunchStoryboardName": "LaunchScreen.storyboard",
            "CFBundleDisplayName" : "$(BUNDLE_DISPLAY_NAME)",
            "UIApplicationSceneManifest": [
                "UIApplicationSupportsMultipleScenes": false,
                "UISceneConfigurations": [
                    "UIWindowSceneSessionRoleApplication": [
                        [
                            "UISceneConfigurationName": "Default Configuration",
                        ]
                    ]
                ]
            ],
        ]
        
        return .extendingDefault(with: result)
    }
}
