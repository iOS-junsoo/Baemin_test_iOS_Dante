//
//  pEntity.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/12.
//

import Foundation
struct pResponse: Decodable {
    var isSuccess : Bool?
    var code: Int?
    var message: String?
    var result: pUser?
}

struct pUser: Decodable {
    var certificationNumber: String?
}
