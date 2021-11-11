//
//  infoDataManager.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/11.
//

import Foundation
import Alamofire

class InfoRequest {
    func getData() {
        let url = "\(Constant.sever_URL)/app/stores/info/1"
        
    
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: nil,
                   interceptor: nil,
                   requestModifier: nil)
            .responseDecodable(of: infoResponse.self) { response in
            
            switch response.result {
            case .success(let response):
                print("DEBUG>> Success \(response) ")

                
               
            case .failure(let error):
                print("DEBUG>> Error : \(error)")
            }
            
        }
    }
}
