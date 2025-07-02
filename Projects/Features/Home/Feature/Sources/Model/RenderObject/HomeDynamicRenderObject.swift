//
//  HomeDynamicRenderObject.swift
//  HomeModule
//
//  Created by 최재혁 on 7/3/25.
//

public struct HomeDynamicRenderObject {
    let affection : String
    let affectionPercent : String
    let name : String
    let level : String
    
    init(affection: String, affectionPercent : String, name : String, level : String) {
        self.affection = affection
        self.affectionPercent = affectionPercent
        self.name = name
        self.level = level
    }
}
