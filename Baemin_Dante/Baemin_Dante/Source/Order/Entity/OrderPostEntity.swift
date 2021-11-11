//
//  OrderPostEntity.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/12.
//

import Foundation


struct OrderPostResponse: Decodable {
    var isSuccess : Bool?
    var code: Int?
    var message: String?
    var result: OrderPost?
}

struct OrderPost: Decodable {
    var ordersIdx: Int?
}
