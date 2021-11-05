//
//  DataManager.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/04.
//

import Foundation
import Alamofire

class JoinRequest {
    func postData() {
        let url = "\(Constant.sever_URL)/app/users"
        let params = ["id_email" : UserInfo.email,
                      "password" : UserInfo.passWord,
                      "phoneNumber" : UserInfo.phoneNumber,
                      "nickname" : UserInfo.nickName,
                      "agreementCollection" : JoinCheck.agreementCollection,
                      "agreementProvision" : JoinCheck.agreementProvision,
                      "agreementMail" : JoinCheck.agreementMail,
                      "agreementSMS" : JoinCheck.agreementSMS,
                      "over14" : JoinCheck.over14]
        
        AF.request(url,
                   method: .post,
                   parameters: params,
                   encoder: JSONParameterEncoder(),
                   headers: ["Content-Type":"application/json; charset=utf-8"])
            .validate()
            .responseDecodable(of: JoinResponse.self) { response in
            
            switch response.result {
            case .success(let response):
                print("DEBUG>> Success \(response) ")
                JoinSeverResponse.ResponseValue = response.message!
            case .failure(let error):
                print("DEBUG>> Error : \(error.localizedDescription)")
            }
            
        }
       
    }
}

