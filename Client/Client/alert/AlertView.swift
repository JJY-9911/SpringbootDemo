//
//  AlertView.swift
//  Client
//
//  Created by 江佳谊 on 2023/11/30.
//

import SwiftUI

struct AlertView: View {
    @ObservedObject var alertVM: AlertVM
    var body: some View {
        Text(alertVM.msg)
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(Color("white2"))
            .background(Color(alertVM.color))
            .cornerRadius(8)
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(alertVM: AlertVM(show: true, msg: "default", color: "red"))
    }
}
