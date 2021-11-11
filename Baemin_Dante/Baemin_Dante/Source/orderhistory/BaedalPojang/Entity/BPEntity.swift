//
//  BPEntity.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/11.
//

import Foundation

struct BPResponse: Decodable {
    var isSuccess : Bool?
    var code: Int?
    var message: String?
    var result: [OrderHis]
}

struct OrderHis: Decodable {
   var orderDate: String?
   var deliveryStatus: String?
   var storeImage: String?
   var storeName: String?
   var totalPrice: Int?
   var otherMenusCount: Int?
   var menuName: String?
   var orderIdx: Int?
}
