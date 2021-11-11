//
//  LoginDataManager.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/05.
//

import Foundation
import Alamofire

class LoginRequest {
    func postData() {
        let url = "\(Constant.sever_URL)/app/users/login"
        let params = [
            "id_email" : Login.id,
            "password" : Login.pw]
        
        AF.request(url,
                   method: .post,
                   parameters: params,
                   encoder: JSONParameterEncoder(),
                   headers: ["Content-Type":"application/json; charset=utf-8"])
            .validate()
            .responseDecodable(of: LoginResponse.self) { response in
            
            switch response.result {
            case .success(let response):
                print("DEBUG>> Success \(response) ")
                //로그인한 사용자 정보 가져오기
                LoginSeverResponse.ResponseValue = response.isSuccess!
                LoginSeverResponse.ResponseEmail = response.result?.id_email ?? ""
                LoginSeverResponse.ResponsePassword = response.result?.password ?? ""
                LoginSeverResponse.ResponsePhoneNumber = response.result?.phoneNumber ?? ""
                LoginSeverResponse.ResponseNickName = response.result?.nickname ?? ""
                LoginSeverResponse.ResponseGrade = response.result?.grade ?? ""
                LoginSeverResponse.ResponseUserIdx = response.result?.userIdx ?? 0
                
                print("로그인 성공!: 사용자 정보 가져오기")
                print(LoginSeverResponse.ResponseValue)
                print(LoginSeverResponse.ResponseEmail)
                print(LoginSeverResponse.ResponsePassword)
                print(LoginSeverResponse.ResponsePhoneNumber)
                print(LoginSeverResponse.ResponseNickName)
                print(LoginSeverResponse.ResponseGrade)
                
                

                
            case .failure(let error):
                print("DEBUG>> Error : \(error.localizedDescription)")
            }
            
        }
    }
}


//"id_email" : "tes12312t@naver.com",
//"password" : "qweasdzxc1234"
