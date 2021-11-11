//
//  infoEntity.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/11.
//

import Foundation

struct infoResponse: Decodable {
    var isSuccess : Bool?
    var code: Int?
    var message: String?
    var result: InfoMenu?
}

struct InfoMenu: Decodable {
    var info_basic: Info_basic?
    var info_detail: Info_detail?
    var info_delivery: [Info_delivery]
}

struct Info_basic: Decodable {
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

struct Info_detail: Decodable {
    var business_name: String?
    var operation_time: String?
    var preparation_time: String?
    var holiday: String?
    var phone_number: String?
    var is_050: String?
    var delivery_area: String?
    var recent_order_ten: Int?
    var total_review_ten: Int?
}

struct Info_delivery: Decodable {
    var group: String?
    var name: String?
    var fee: Int?
}
