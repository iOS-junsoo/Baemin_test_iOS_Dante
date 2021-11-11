//
//  BPDataManager.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/11.
//

import Foundation
import Alamofire

class BPRequest {
    func getData() {
        let url = "\(Constant.sever_URL)/app/orders/\(LoginSeverResponse.ResponseUserIdx)"
        
    
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: nil,
                   interceptor: nil,
                   requestModifier: nil)
            .responseDecodable(of: BPResponse.self) { response in
            
            switch response.result {
            case .success(let response):
                print("DEBUG>> Success \(response) ")
                BPDataModel.storeImage = response.result[0].storeImage
                BPDataModel.storeName = response.result[0].storeName
                BPDataModel.totalPrice = response.result[0].totalPrice
                BPDataModel.otherMenusCount = response.result[0].otherMenusCount
                BPDataModel.menuName = response.result[0].menuName
                BPDataModel.orderIdx = response.result[0].orderIdx
                
                BPDataModel1.storeImage = response.result[1].storeImage
                BPDataModel1.storeName = response.result[1].storeName
                BPDataModel1.totalPrice = response.result[1].totalPrice
                BPDataModel1.otherMenusCount = response.result[1].otherMenusCount
                BPDataModel1.menuName = response.result[1].menuName
                BPDataModel1.orderIdx = response.result[1].orderIdx
                
            case .failure(let error):
                print("DEBUG>> Error : \(error)")
            }
            
        }
    }
}


