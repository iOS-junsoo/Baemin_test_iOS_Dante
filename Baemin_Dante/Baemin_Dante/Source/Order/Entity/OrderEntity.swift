//
//  OrderEntity.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/11.
//

import Foundation

struct OrderResponse: Decodable {
    var isSuccess : Bool?
    var code: Int?
    var message: String?
    var result: Order?
}

struct Order: Decodable {
    var phonenumber: String?
    var requestToCeoAgain: Int?
    var requestToRiderAgain: Int?
    var baeminMoney: Int?
    var deliveryFee: Int?
}
