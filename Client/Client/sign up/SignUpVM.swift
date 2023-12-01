//
//  SignUpVM.swift
//  Client
//
//  Created by 江佳谊 on 2023/11/30.
//

import Foundation

class SignUpVM: ObservableObject{
    @Published
    var tel: String = ""
    
    @Published
    var telCheck: Bool = false
    
    @Published
    var password: String = ""
    
    @Published
    var passwordCheck: Bool = false
    
    @Published
    var comfirm: String = ""
    
    @Published
    var comfirmCheck: Bool = false
    
    @Published
    var back: Bool = false
    
    @Published
    var light: Bool = false
    
    @Published
    var responseHandler: SignUpResponseModel?
}

