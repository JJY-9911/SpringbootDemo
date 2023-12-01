//
//  AlertVM.swift
//  Client
//
//  Created by 江佳谊 on 2023/11/30.
//

import Foundation

class AlertVM: ObservableObject {
    @Published
    var show: Bool = false
    
    @Published
    var msg: String = "alert"
    
    @Published
    var color: String = ""
    
    init(show: Bool, msg: String, color: String) {
        self.show = show
        self.msg = msg
        self.color = color
    }
    
    init(){}
    
}
