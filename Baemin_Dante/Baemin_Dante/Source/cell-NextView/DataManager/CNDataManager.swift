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
        let url = "\(Constant.sever_URL)/stores/menu/1"
        
    
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
                print(response.result[0].info_basic[0].ad_type)
                
                
               
            case .failure(let error):
                print("DEBUG>> Error : \(error.localizedDescription)")
            }
            
        }
    }
}
