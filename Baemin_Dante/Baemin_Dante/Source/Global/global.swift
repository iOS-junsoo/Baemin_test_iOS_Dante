//
//  global.swift
//  Baemin_Dante
//
//  Created by 준수김 on 2021/10/31.
//

import Foundation

struct Location {
    static var totalLocation = ""
    static var titleLocation = ""
    static var detailLocation = ""
}

struct KakaoLogin {
    static var userName = ""
    static var userImagedata = "" //타입 결정 못함.
    static var userEmail = ""
}

struct UserInfo {
    static var phoneNumber = ""
    static var email = ""
    static var nickName = ""
    static var passWord = ""
    static var latitude = 0.000000
    static var longitude = 0.000000
    static var location = ""
}

//회원가입 완료후 마이배민 화면으로 돌아가게 만드는 전역번수
struct Check {
    static var dis = 0
}
