//
//  AppDelegate.swift
//  Meow
//
//  Created by 최재혁 on 5/19/25.
//

import UIKit
import CoreUtil

@main
class AppDelegate : UIResponder, UIApplicationDelegate {
    
    //앱 시작 초기화
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        dependencyInjection()
        
        return true
    }
    
    // 앱 시작 또는 새로운 Scene 생성시 실행되는 코드
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        let sceneConfig = UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
        
        sceneConfig.delegateClass = SceneDelegate.self
        
        return sceneConfig
    }
    
    //백그라운드 전환 -> 대화 내용 저장
    func applicationDidEnterBackground(_ application: UIApplication) {
        // TODO: 대화 내용 저장
    }
    
    // 포그라운드 전환 -> 대화 내용 불러오기
    func applicationWillEnterForeground(_ application: UIApplication) {
        // TODO: 대화 내용 불러오기
    }
    
    private func dependencyInjection() {
        DependencyInjector.shared.assemble([
            DataAssembly(),
            DomainAssembly(),
            SharedAssembly(),
            UtilAssembly()
        ])
    }
}
