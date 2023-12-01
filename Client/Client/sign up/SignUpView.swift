//
//  RegisterView.swift
//  Client
//
//  Created by 江佳谊 on 2023/11/29.
//

import SwiftUI
import Alamofire

struct RegisterView: View {
    @StateObject private var signUpVM = SignUpVM()
    @StateObject private var alertVM = AlertVM()
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack{
            Color("black2")
            VStack{
                register()
                nameInput()
                passwordInput()
                confirm()
                AlertView(alertVM: alertVM)
                    .opacity(alertVM.show ? 1 : 0)
                    .padding(.vertical, 80)
                done()
                Spacer()
            }
            .onChange(of: signUpVM.tel){_ in
                
                checkShow()
            }
            .onChange(of: signUpVM.password){_ in
                
                checkShow()
            }
            .onChange(of: signUpVM.comfirm){_ in
              
                checkShow()
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
    
    private func checkCompletion() -> Bool{
        if signUpVM.telCheck && signUpVM.passwordCheck && signUpVM.comfirmCheck {
            signUpVM.light = true
            return true
        }else {
            signUpVM.light = false
            return false
        }
    }
    
    private func comfirm() -> Bool {
        if signUpVM.password == signUpVM.comfirm {
            return true
        }else {
            return false
        }
    }
    
    func signUp( _ tel: String, _ password: String) {
        let action: String = SERVER_IP + "/register"
        let param = User(tel: tel, password: password)
        AF.request(
        action,
        method: .post,
        parameters: param,
        encoder: JSONParameterEncoder.default
        ).responseString(encoding: .utf8){response in
            print("解码：\(response)")
            switch(response.result){
            case .success(let str):
                break
            case .failure(let error):
                setAlert("Fail, please check network.", "red")
                break
            }
        }
        .responseDecodable(of: SignUpResponseModel.self){response in
            var rm = SignUpResponseModel(code: -1, msg: "")
            if let rm = response.value {
                if rm.code == 0{
                    setAlert(rm.msg, "green")
                    DispatchQueue.main.asyncAfter(deadline: .now()+1){self.presentationMode.wrappedValue.dismiss()}
                    
                }else {
                    setAlert(rm.msg, "red")
                }
                
            }
        }
    }
    
    private func setAlert(_ msg: String, _ color: String){
        if alertVM.show == false {
            withAnimation(.spring()){
                alertVM.msg = msg
                alertVM.color = color
                alertVM.show = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now()+4){
                withAnimation(.spring()){
                    setAlert("", "")
                    alertVM.show = false
                }
            }
        }
    }//setAlert
    
    private func checkShow(){
        if signUpVM.tel.count == 11{
            withAnimation(.spring()){signUpVM.telCheck = true}
        }else {
            withAnimation(.spring()){signUpVM.telCheck = false}
        }
        
        if signUpVM.password.count > 0 {
            withAnimation(.spring()){signUpVM.passwordCheck = true}
        }else {
            withAnimation(.spring()){signUpVM.passwordCheck = false}
        }
        
        if signUpVM.comfirm.count > 0 && signUpVM.comfirm == signUpVM.password{
            withAnimation(.spring()){signUpVM.comfirmCheck = true}
        }else {
            withAnimation(.spring()){signUpVM.comfirmCheck = false}
        }
        checkCompletion()
    }//checkShow
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

extension RegisterView{
    
    
    @ViewBuilder
    private func register() -> some View{
        GeometryReader { proxy in
            let w = proxy.size.width
            let h = proxy.size.height
            Rectangle()
                .frame(height: SCREEN_HEIGHT/3.5)
                .foregroundColor(Color("blue2"))
                .cornerRadius(20)
            Image("back")
                .resizable()
                .frame(width: 40, height: 40)
                .position(x: w/8,y:h/5)
                .onTapGesture {
                    self.presentationMode.wrappedValue.dismiss()
                }
            
            HStack{
                Text("Sign Up")
                    .foregroundColor(Color("black2"))
                    .font(.system(size: 56, weight: .heavy))
                    .position(x: w/3, y: h-40)
            }
            .padding(.leading, 20)
        }
        .frame(width: SCREEN_WIDTH-10,height: SCREEN_HEIGHT/3.5)
        .padding(.bottom, 18)
    }
    
    @ViewBuilder
    private func nameInput() -> some View{
        HStack(spacing: 0){
            ZStack(alignment: .center){
                HStack{
                    Image("user")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(.leading, 16)
                    TextField("tel",text: $signUpVM.tel)
                        .background(.clear)
                        .foregroundColor(.black)
                }
            }
            .frame(height: 48)
            .background(Color("white2"))
            .cornerRadius(12)
            Image("check")
                .resizable()
                .frame(width: signUpVM.telCheck ? 24 : 0, height: 24)
                .padding(.leading, signUpVM.telCheck ? 5 : 0)
        }
        .padding(.horizontal,20)
    }
    
    @ViewBuilder
    private func passwordInput() -> some View{
        HStack(spacing: 0){
            ZStack(alignment: .center){
                HStack{
                    Image("key")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(.leading, 16)
                    TextField("password",text: $signUpVM.password)
                        .background(.clear)
                        .foregroundColor(.black)
                }
            }
            .frame(height: 48)
            .background(Color("white2"))
            .cornerRadius(12)

            
            Image("check")
                .resizable()
                .frame(width: signUpVM.passwordCheck ? 24 : 0, height: 24)
                .padding(.leading, signUpVM.passwordCheck ? 5 : 0)
            
        }
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    private func confirm() -> some View{
        HStack(spacing: 0){
            ZStack(alignment: .center){
                HStack{
                    Image("key")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(.leading, 16)
                    TextField("password",text: $signUpVM.comfirm)
                        .background(.clear)
                        .foregroundColor(.black)
                }
            }
            .frame(height: 48)
            .background(Color("white2"))
            .cornerRadius(12)

            
            Image("check")
                .resizable()
                .frame(width: signUpVM.comfirmCheck ? 24 : 0, height: 24)
                .padding(.leading, signUpVM.comfirmCheck ? 5 : 0)
            
        }
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    private func done() -> some View{
        Button(
            action: {
                if checkCompletion(){
                    if comfirm(){
                        signUp(signUpVM.tel, signUpVM.password)
                    }else {
                        setAlert("Password inconsistency, please try again.", "red")
                    }
                }else {
                    setAlert("Please enter complete information.", "red")
                }
            }){
                Text("done")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color(signUpVM.light ? "black2" : "white2"))
                    .frame(width: SCREEN_WIDTH-80, height: 48)
                    .background(Color(signUpVM.light ? "blue2" : "green3"))
                    .cornerRadius(32)
            }
    }
}
