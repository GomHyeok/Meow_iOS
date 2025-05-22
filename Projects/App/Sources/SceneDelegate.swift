//
//  SceneDelegate.swift
//  Meow
//
//  Created by 최재혁 on 5/19/25.
//

import UIKit
import RootFeature

class SceneDelegate : UIResponder, UIWindowSceneDelegate {
    
    var window: RootWindow?
    
    var rootRouter : RootRouter?
    
    // Scene생성시 UI를 구성
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let builder = RootBuilder()
        rootRouter = builder.build()
        
        window = RootWindow(windowScene: windowScene)
        
        window?.rootViewController = rootRouter?.viewController
        window?.makeKeyAndVisible()
    }
    
    // 화면이 백그라운드로 들어가는 경우
    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }
}
