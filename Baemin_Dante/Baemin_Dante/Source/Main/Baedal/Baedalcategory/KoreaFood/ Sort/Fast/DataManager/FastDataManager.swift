//
//  FastDataManager.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/10.
//

import Foundation
import Alamofire

class FastRequest {
    func getData() {
        let url = "\(Constant.sever_URL)/app/stores"
        
        let params = [ "category" : "한식"]
    
        AF.request(url,
                   method: .get,
                   parameters: params,
                   encoding: URLEncoding.queryString)
            .validate()
            .responseDecodable(of: FastResponse.self) { response in
            
            switch response.result {
            case .success(let response):
                print("DEBUG>> Success \(response) ")
                //로그인한 사용자 정보 가져오기
                FastDataModel.ResponseisSuccess = response.isSuccess
                FastDataModel.name = response.result[0].name ?? ""
                FastDataModel.image = response.result[0].image ?? ""
                FastDataModel.avg_star = response.result[0].avg_star ?? 0.0
                FastDataModel.review_cnt = response.result[0].review_cnt ?? ""
                FastDataModel.two_menus = response.result[0].two_menus ?? ""
                FastDataModel.min_order_price = response.result[0].min_order_price ?? 0
                FastDataModel.min_delivery_fee = response.result[0].min_delivery_fee ?? 0
                
                print("Get 성공")
                print(FastDataModel.name)
                print(FastDataModel.image)
                print(FastDataModel.avg_star)
                print(FastDataModel.review_cnt)
                print(FastDataModel.two_menus)
                print(FastDataModel.min_order_price)
                print(FastDataModel.min_delivery_fee)
                
                
                
               
            case .failure(let error):
                print("DEBUG>> Error : \(error.localizedDescription)")
            }
            
        }
    }
}
