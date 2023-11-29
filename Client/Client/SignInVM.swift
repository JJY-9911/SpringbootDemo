//
//  LoginVM.swift
//  Client
//
//  Created by 江佳谊 on 2023/11/29.
//

import Foundation
class LoginVM: ObservableObject {
    @Published
    var name: String = ""
    @Published
    var password: String = ""
    
    init(){}
}
