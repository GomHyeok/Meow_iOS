//
//  HomeStaicRenderObject.swift
//  HomeModule
//
//  Created by 최재혁 on 6/16/25.
//

public struct HomeStaicRenderObject {
    let shop : String
    let setting : String
    let talk : String
    let affection : String
    
    init(shop: String, setting: String, talk: String, affection: String) {
        self.shop = shop
        self.setting = setting
        self.talk = talk
        self.affection = affection
    }
}
