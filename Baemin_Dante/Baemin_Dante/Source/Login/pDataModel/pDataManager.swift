//
//  pDataManager.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/12.
//

import Foundation
import Alamofire

class pRequest {
    func postData() {
        let url = "\(Constant.sever_URL)/app/cert/phonenumber"
        let params = ["phonenumber" : UserInfo.phoneNumber]
        
        AF.request(url,
                   method: .post,
                   parameters: params,
                   encoder: JSONParameterEncoder(),
                   headers: ["Content-Type":"application/json; charset=utf-8"])
            .validate()
            .responseDecodable(of: pResponse.self) { response in
            
            switch response.result {
            case .success(let response):
//                print("DEBUG>> Success \(response) ")
                print("성공")
            case .failure(let error):
                print("DEBUG>> Error : \(error)")
            }
            
        }
       
    }
}
