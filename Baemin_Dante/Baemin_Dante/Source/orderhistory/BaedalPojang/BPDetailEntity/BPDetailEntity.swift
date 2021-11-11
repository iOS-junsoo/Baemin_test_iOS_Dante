//
//  BPDetailEntity.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/11.
//

import Foundation

struct BPDetailResponse: Decodable {
    var isSuccess : Bool?
    var code: Int?
    var message: String?
    var result: OrderDetail?
}

struct OrderDetail: Decodable {
    var deliveryStatus: String?
    var storeName: String?
    var orderDate: String?
    var menuChoice: [MenuChoice]
    var totalPrice: Int?
    var deliveryTip: Int?
    var paymentMethod: String?
    var deliveryAddress: String?
    var phonenumber: String?
    var requestToCeo: String?
    var requestToRider: String?
    var orderIdx: Int?
    
}

struct MenuChoice: Decodable {
    var menuName: String?
    var menuPrice: Int?
    var menuOptionInfos: [MenuOptionInfos]
    var count: Int?
    var customPrice: Int?
}

struct MenuOptionInfos: Decodable {
    var name: String?
    var price: Int?
}
