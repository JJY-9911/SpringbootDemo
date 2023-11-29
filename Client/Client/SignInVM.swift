//
//  LoginVM.swift
//  Client
//
//  Created by 江佳谊 on 2023/11/29.
//

import Foundation
class SignInVM: ObservableObject {
    @Published
    var name: String = ""
    @Published
    var password: String = ""
    
    @Published
    var go: Bool = false
    
    @Published
    var goRegister: Bool = false
    
    init(){}
}
