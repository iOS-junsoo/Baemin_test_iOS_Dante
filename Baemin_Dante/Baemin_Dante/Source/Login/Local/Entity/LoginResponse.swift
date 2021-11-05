//
//  LoginEntity.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/05.
//

import Foundation

struct LoginResponse: Decodable {
    var isSuccess : Bool?
    var code: Int?
    var message: String?
    var result: UserList?
}

struct UserList: Decodable {
    var userIdx: Int?
    var id_email: String?
    var password: String?
    var phoneNumber: String?
    var nickname: String?
    var image: String?
    var grade: String
    
    var jwt: String?
    
}
