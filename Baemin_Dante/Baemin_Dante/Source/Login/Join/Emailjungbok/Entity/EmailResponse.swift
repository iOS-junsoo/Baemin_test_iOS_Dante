//
//  EmailResponse.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/11/05.
//

import Foundation
struct EmailResponse: Decodable {
    var isSuccess : Bool?
    var code: Int?
    var message: String?
    var result: String?
}
