//
//  OrderDataManager.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/11.
//

import Foundation
import Alamofire

class OrderRequest {
    func getData() {
        let url = "\(Constant.sever_URL)/app/users/pre-order/\(LoginSeverResponse.ResponseUserIdx)"
        
    
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: nil,
                   interceptor: nil,
                   requestModifier: nil)
            .responseDecodable(of: OrderResponse.self) { response in
            
            switch response.result {
            case .success(let response):
                print("DEBUG>> Success \(response) ")
                OrederDataModel.orderPhone = response.result?.phonenumber ?? ""
                OrederDataModel.orderDeliveryFee = response.result?.deliveryFee ?? 0
               
            case .failure(let error):
                print("DEBUG>> Error : \(error)")
            }
            
        }
    }
}
