//
//  ReviewModel.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/09.
//

import Foundation

struct ReviewModel {
    var nickName: String
    var day: String
    var review: String
    var menu: String
    
    
    init(nickName: String, day: String, review: String, menu: String){
        self.nickName = nickName
        self.day = day
        self.review = review
        self.menu = menu
        
    }
}

