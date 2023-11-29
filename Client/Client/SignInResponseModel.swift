//
//  SignInResponseModel.swift
//  Client
//
//  Created by 江佳谊 on 2023/11/29.
//

import Foundation

class SignInResponseModel: Decodable{
    var code: Int
    var msg: String
    var userInfo: UserInfo
}

struct UserInfo: Decodable{
    var id: Int
    var name: String
    var password: String
    var vip: Int
}
