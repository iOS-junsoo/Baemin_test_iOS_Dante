//
//  BaketModel.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/07.
//

import Foundation

//tableView 모델
struct BaketModel {
    var foodTitle: String
    var foodPrice: Int
    
}

//전역변수
struct BaketGrobal {
    static var foodPrice = "0원"
    static var foodCount = "1개"
    static var totalPrice = "0원"
}
struct Baket {
    static var foodPrice = 0
    static var foodtotalPrice = 0
    static var totalPrice = 0
}
