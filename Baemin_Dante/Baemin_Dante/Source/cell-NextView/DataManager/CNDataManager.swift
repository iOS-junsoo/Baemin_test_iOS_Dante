//
//  CNDataManager.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/10.
//

import Foundation
import Alamofire

class CNRequest {
    func getData() {
        let url = "\(Constant.sever_URL)/app/stores/menu/1"
        
    
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: nil,
                   interceptor: nil,
                   requestModifier: nil)
            .responseDecodable(of: CNResponse.self) { response in
            
            switch response.result {
            case .success(let response):
                print("DEBUG>> Success \(response) ")
                //로그인한 사용자 정보 가져오기
//                print(response.result?.menus[0].name)
                CNDataModel.restaurantName = response.result?.info_basic?.name ?? ""
                CNDataModel.restaurantStar = response.result?.info_basic?.avg_star ?? 0.0
                CNDataModel.restaurantReview = response.result?.info_basic?.recent_reply_cnt ?? 0
                CNDataModel.restaurantBossComment = response.result?.info_basic?.recent_reply_cnt ?? 0
                CNDataModel.restaurantJjim = response.result?.info_basic?.dips_cnt ?? 0
                CNDataModel.restaurantOrderPay = response.result?.info_basic?.min_order_price ?? 0
                CNDataModel.restaurantDeliveryTime = response.result?.info_basic?.tag_delivery_time ?? "판매자가 작성하지 않음."
                CNDataModel.restaurantDeliveryPay = response.result?.info_basic?.min_delivery_fee ?? 0
                CNInsideDataModel.menus = response.result!.menus
//                print("인딕섹\(CNInsideDataModel.menus[0])")
//                print(CNInsideDataModel.menus[1])
//                print(CNInsideDataModel.menus[2])
               
            case .failure(let error):
                print("DEBUG>> Error : \(error)")
            }
            
        }
    }
}
