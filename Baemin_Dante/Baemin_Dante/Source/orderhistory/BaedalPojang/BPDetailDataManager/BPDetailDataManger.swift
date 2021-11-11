//
//  BPDetailDataManger.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/11.
//

import Foundation
import Alamofire

class BPDetailRequest {
    func getData() {
        let url = "\(Constant.sever_URL)/app/orders/detail/\(BPDataModel.orderIdx!)"
        
    
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: nil,
                   interceptor: nil,
                   requestModifier: nil)
            .responseDecodable(of: BPDetailResponse.self) { response in
            
            switch response.result {
            case .success(let response):
                print("DEBUG1111>> Success \(response) ")
                BPDetilModelData.storeName = (response.result?.storeName!)!
                BPDetilModelData.menuName = (response.result?.menuChoice[0].menuName)!
                BPDetilModelData.menuPrice = (response.result?.menuChoice[0].menuPrice)!
                BPDetilModelData.optionMenu1Name = (response.result?.menuChoice[0].menuOptionInfos[0].name)!
                BPDetilModelData.optionMenu1Price = (response.result?.menuChoice[0].menuOptionInfos[0].price)!
                BPDetilModelData.optionMenu2Name = (response.result?.menuChoice[0].menuOptionInfos[1].name)!
                BPDetilModelData.optionMenu2Price = (response.result?.menuChoice[0].menuOptionInfos[1].price)!
                BPDetilModelData.totalPrice = (response.result?.totalPrice!)!
                BPDetilModelData.deliveryTip = (response.result?.deliveryTip!)!
                BPDetilModelData.location = (response.result?.deliveryAddress!)!
                BPDetilModelData.phone = (response.result?.phonenumber!)!
                
            case .failure(let error):
                print("DEBUG>> Error : \(error)")
            }
            
        }
    }
}

