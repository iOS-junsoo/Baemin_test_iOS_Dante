//
//  SearchDataManager.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/12.
//

import Foundation
import Alamofire

class SearchRequest {
    func getData() {
        let url = "\(Constant.sever_URL)/app/stores/search"
        
        let params = [ "keyword" : SearchModel.search]
    
        AF.request(url,
                   method: .get,
                   parameters: params,
                   encoding: URLEncoding.queryString)
            .validate()
            .responseDecodable(of: SearchResponse.self) { response in
            
            switch response.result {
            case .success(let response):
                print("DEBUG>> Success \(response) ")
                //로그인한 사용자 정보 가져오기
                SearchModel.model = response.result
                print(SearchModel.model[0])
               
                
            
            case .failure(let error):
                print("DEBUG>> Error : \(error.localizedDescription)")
            }
            
        }
    }
}

