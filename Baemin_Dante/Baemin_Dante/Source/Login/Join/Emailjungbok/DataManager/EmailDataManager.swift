//
//  EmailDataManager.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/05.
//

import Foundation
import Alamofire

class EmailRequest {
    func postData() {
        let url = "\(Constant.sever_URL)/app/users/id-check"
        let params = [ "id_email" : UserInfo.email]
        
        AF.request(url,
                   method: .post,
                   parameters: params,
                   encoder: JSONParameterEncoder(),
                   headers: ["Content-Type":"application/json; charset=utf-8"])
            .validate()
            .responseDecodable(of: EmailResponse.self) { response in
            
            switch response.result {
            case .success(let response):
                print("DEBUG>> Success \(response) ")
                EmailSeverResponse.ResponseValue = response.isSuccess!
                print(EmailSeverResponse.ResponseValue)
               
            case .failure(let error):
                print("DEBUG>> Error : \(error.localizedDescription)")
            }
            
        }
       
    }
}



