//
//  MBDataModel.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/11.
//

import Foundation
import Alamofire

class MBRequest {
    func getData() {
        let url = "\(Constant.sever_URL)/app/users/\(LoginSeverResponse.ResponseUserIdx)"
        
    
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: nil,
                   interceptor: nil,
                   requestModifier: nil)
            .responseDecodable(of: MBResponse.self) { response in
            
            switch response.result {
            case .success(let response):
                print("DEBUG>> Success \(response) ")
                MBDataModel.MBEmail = response.result?.email ?? ""
                MBDataModel.MBNickName = response.result?.nickname ?? ""
               
            case .failure(let error):
                print("DEBUG>> Error : \(error)")
            }
            
        }
    }
}
