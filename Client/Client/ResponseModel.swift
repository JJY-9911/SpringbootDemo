//
//  ResponseModel.swift
//  Client
//
//  Created by 江佳谊 on 2023/11/29.
//

import Foundation

//响应
struct SignInResponseModel: Decodable{
    var code: Int
    var msg: String
    var userInfo: UserInfo?
    
    init(code: Int, msg: String, userInfo: UserInfo? = nil) {
        self.code = code
        self.msg = msg
        self.userInfo = userInfo
    }
}

struct SignUpResponseModel: Decodable{
    var code: Int
    var msg: String
    var userInfo: UserInfo?
    
    init(code: Int, msg: String, userInfo: UserInfo? = nil) {
        self.code = code
        self.msg = msg
        self.userInfo = userInfo
    }
}

struct UserInfo: Decodable{
    var id: Int
    var tel: String
    var password: String
    var vip: Int
}
//请求参数
struct User: Encodable {
    let tel: String
    let password: String
}
