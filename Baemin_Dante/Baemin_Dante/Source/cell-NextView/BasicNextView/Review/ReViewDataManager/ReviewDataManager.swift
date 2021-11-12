//
//  ReviewDataManager.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/12.
//

import Foundation
import Alamofire

class ReviewRequest {
    func getData() {
        let url = "\(Constant.sever_URL)/app/stores/review/1"
        
    
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: nil,
                   interceptor: nil,
                   requestModifier: nil)
            .responseDecodable(of: ReviewResponse.self) { response in
            
            switch response.result {
            case .success(let response):
                print("DEBUG11>> Success \(response) ")
                ReViewDataModel.ReviewModel = response.result[0].reviews
               
            case .failure(let error):
                print("DEBUG>> Error : \(error)")
            }
            
        }
    }
}
