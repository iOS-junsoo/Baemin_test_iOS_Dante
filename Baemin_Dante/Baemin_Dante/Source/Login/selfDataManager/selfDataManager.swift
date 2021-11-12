//
//  selfDataManager.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/12.
//

import Foundation
import Alamofire

class sRequest {
    func getData() {
        let url = "\(Constant.sever_URL)/app/cert/cert-number"
        let params = ["phonenumber" : UserInfo.phoneNumber,
                      "certNum" : UserInfo.inje]
        
        AF.request(url,
                    method: .get,
                   parameters: params,
                   encoding: JSONEncoding.default)
                    .validate()
                    .responseDecodable(of: sResponse.self) { response in
            
            switch response.result {
            case .success(let response):
//                print("DEBUG>> Success \(response) ")
                print("성공")
                sModel.check = response.isSuccess!
            case .failure(let error):
                print("DEBUG>> Error : \(error)")
            }
            
        }
       
    }
}
