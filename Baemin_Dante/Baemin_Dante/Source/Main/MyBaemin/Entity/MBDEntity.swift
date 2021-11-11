//
//  MBDEntity.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/11.
//

import Foundation

struct MBResponse: Decodable {
    var isSuccess : Bool?
    var code: Int?
    var message: String?
    var result: Userin?
}

struct Userin: Decodable {
    var nickname: String?
    var email: String?
    var grade: String?
    var image: String?
    var phone_number: String?
    var agreement_mail: Bool?
    var agreement_SMS: Bool?
}
