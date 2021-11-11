//
//  ReviewEntity.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/12.
//

import Foundation
struct ReviewResponse: Decodable {
    var isSuccess : Bool?
    var code: Int?
    var message: String?
    var result: [SearchInfo]
}

struct SearchInfo: Decodable {
    var info_basic: ReviewList?
    var reviews: [ReViews]
}

struct ReviewList: Decodable {
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

struct ReViews: Decodable {
    var users_idx: Int?
   var nickname: String?
   var star_score: Double?
   var image1: String?
   var image2: String?
   var image3: String?
   var image4: String?
   var image5: String?
   var contents: String?
   var created_at: String?
}
