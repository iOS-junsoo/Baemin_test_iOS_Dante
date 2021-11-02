//
//  Model.swift
//  Tableview-Baemin_Demo
//
//  Created by 준수김 on 2021/11/02.
//

import Foundation

struct Model {
    let imageName: String
    
    init(imageName: String) {
        self.imageName = imageName
    }
}

struct Model2 {
    let imageName: String
    
    init(imageName: String) {
        self.imageName = imageName
    }
}

struct Model3 {
    let imageName: String
    var baeminName: String
    var baeminStar: String
    var baeminTip: String
    var imageTime: String
    init(imageName: String, baeminName: String, baeminStar: String, baeminTip: String, imageTime: String) {
        self.imageName = imageName
        self.baeminName = baeminName
        self.baeminStar = baeminStar
        self.baeminTip = baeminTip
        self.imageTime = imageTime
    }
}
