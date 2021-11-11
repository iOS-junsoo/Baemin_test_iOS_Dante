//
//  OrderPostDataManager.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/12.
//

import Foundation
import Alamofire

class OrederPostRequest {
    func postData() {
        let url = "\(Constant.sever_URL)/app/orders"
        let params = ["usersIdx" : "\(LoginSeverResponse.ResponseUserIdx)",
                      "deliveryAddress" : UserInfo.location,
                      "isSafety" : "0",
                      "requestToCeo" : "덜 맵게 해주세요",
                      "requestToRider" : "조심히 안전하게 와주세요",
                      "isSpoon" : "0",
                      "paymentMethod" : "A"]
        
        AF.request(url,
                   method: .post,
                   parameters: params,
                   encoder: JSONParameterEncoder(),
                   headers: ["Content-Type":"application/json; charset=utf-8"])
            .validate()
            .responseDecodable(of: OrderPostResponse.self) { response in
            
            switch response.result {
            case .success(let response):
                print("DEBUG>> Success \(response) ")
                
            case .failure(let error):
                print("DEBUG>> Error : \(error.localizedDescription)")
            }
            
        }
       
    }
}
