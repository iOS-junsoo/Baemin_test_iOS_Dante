//
//  CNEntity.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/10.
//

import Foundation

struct CNResponse: Decodable {
    var isSuccess : Bool?
    var code: Int?
    var message: String?
    var result: Menu?
}

struct Menu: Decodable {
    var info_basic: info?
    var menus: [menu]
}

struct info: Decodable {
    var name: String?
    var image: String?
    var avg_star: Double?
    var recent_review_cnt: Int?
    var recent_reply_cnt: Int?
    var dips_cnt: Int?
    var ad_type: String?
    var min_order_price: Int?
    var min_delivery_fee: Int?
    var tag_delivery_time: String?
    var two_menus: String?
    var review_cnt: String?
    var tag_coupon: Bool?
    var tag_pickup: Bool?
    var tag_new: Bool?
    var tag_hygiene: Bool?
}

struct menu: Decodable {
    var group_idx: Int?
    var name: String?
    var image: String?
    var detail: String?
    var price: Int?
    var representative: Bool?
    var popular: Bool?
    var over19: Bool?
    var origin: Bool?
    var origin_contents: String?
}
