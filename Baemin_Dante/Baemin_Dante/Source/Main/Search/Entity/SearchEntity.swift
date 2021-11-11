//
//  SearchEntity.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/12.
//

struct SearchResponse: Decodable {
    var isSuccess : Bool?
    var code: Int?
    var message: String?
    var result: [Search]
}

struct Search: Decodable {
    var store_idx: Int?
    var name: String?
    var image: String?
    var avg_star: Double?
    var recent_review_cnt: Int?
    var recent_reply_cnt: Int?
    var dips_cnt: Int?
    var ad_type: String?
    var min_order_price: Int?
    var min_delivery_fee: Int?
    var tag_delivery_time: Int?
    var two_menus: String?
    var review_cnt: String?
    var tag_coupon: Bool?
    var tag_pickup: Bool?
    var tag_new: Bool?
    var tag_hygiene: Bool?
}
