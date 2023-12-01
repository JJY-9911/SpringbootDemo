//
//  ContentView.swift
//  Client
//
//  Created by 江佳谊 on 2023/11/24.
//

import SwiftUI
import Alamofire

struct SignInView: View {
    @StateObject private var signInVM: SignInVM = SignInVM()
    @StateObject private var alertVM = AlertVM()
    @FocusState private var showKeyborad: Bool
    
    var body: some View {
        NavigationView(){
            GeometryReader{_ in
                ZStack{
                    VStack{
                        welcome()
                        nameInput()
                        passwordInput()
                        
                        AlertView(alertVM: alertVM)
                            .padding(.vertical, 80)
                            .opacity(alertVM.show ? 1 : 0)
                        signInBtn()
                            .padding(.bottom, 20)
                        signUpBtn()
                            
                        Spacer()
                    }
                    
                    NavigationLink(destination: MainView(), isActive: $signInVM.go){
                        EmptyView()
                    }
                    
                    NavigationLink(destination: RegisterView(), isActive: $signInVM.goRegister){
                        EmptyView()
                    }
                }//Z
                .background(Color("black2"))
                .onChange(of: signInVM.tel){_ in
                    checkCompletion()
                }
                .onChange(of: signInVM.password){_ in
                    checkCompletion()
                }
                .onTapGesture {
                    showKeyborad = false
                }
                .ignoresSafeArea()
            }//geo
        }//nav
    }
    
    func login( _ tel: String, _ password: String) {
        let action: String = SERVER_IP + "/login"
        let param = User(tel: tel, password: password)
        AF.request(
        action,
        method: .post,
        parameters: param,
        encoder: JSONParameterEncoder.default
        ).responseString(encoding: .utf8){response in
            debugPrint(response)
            switch(response.result){
            case .success(let str):
                break
            case .failure(let error):
                setAlert("Fail, please check network.", "red")
                break
            }
        }
        .responseDecodable(of: SignInResponseModel.self){response in
            var rm = SignInResponseModel(code: -1, msg: "")
            if let rm = response.value {
                switch(rm.code){
                case 0:
                    signInVM.go = true
                    break
                case 1:
                    setAlert(rm.msg, "red")
                    break
                case 2:
                    setAlert(rm.msg, "red")
                    break
                default:
                    break
                }
            }
        }
    }
    
    func checkCompletion() -> Bool{
        if signInVM.tel != "" && signInVM.password != ""{
            signInVM.light = true
            return true
        }else {
            signInVM.light = false
            return false
        }
    }
    private func setAlert(_ msg: String, _ color: String){
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
    }//setAlert
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

extension SignInView{
    @ViewBuilder
    private func welcome() -> some View{
        GeometryReader { proxy in
            let w = proxy.size.width
            let h = proxy.size.height
            Rectangle()
                .frame(width: w-20,height: SCREEN_HEIGHT/3.5)
                .foregroundColor(Color("green4"))
                .cornerRadius(20)
                .position(x: w/2, y:h/2)
                
            Image("wallet")
                .resizable()
                .frame(width: 48, height: 48)
                .position(x: w/2, y: h/2.5)
            HStack{
                Text("Welcome")
                    .foregroundColor(Color("black2"))
                    .font(.system(size: 56, weight: .heavy))
                    .position(x: w/3, y: h-40)
            }
            .padding(.leading, 20)
        }
        .frame(height: SCREEN_HEIGHT/3.5)
        .padding(.bottom, 18)
    }
    
    @ViewBuilder
    private func lock() -> some View{
        Image("lock")
            .resizable()
            .frame(width: 96, height: 96)
    }
    
    @ViewBuilder
    private func nameInput() -> some View{
        ZStack(alignment: .center){
            HStack{
                Image("user")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(.leading, 16)
                TextField("tel",text: $signInVM.tel)
                    .background(.clear)
                    .foregroundColor(.black)
                    .focused($showKeyborad)
            }
        }
        .frame(width: SCREEN_WIDTH-40, height: 48)
        .background(Color("white2"))
        .cornerRadius(12)
        .padding(.bottom, 8)
    }
    
    @ViewBuilder
    private func passwordInput() -> some View{
        ZStack(alignment: .center){
            HStack{
                if !signInVM.showPassword{
                    Spacer()
                }
                Rectangle()
                    .frame(width: signInVM.showPassword ? SCREEN_WIDTH-44 : 0, height: 44)
                    .cornerRadius(12)
                    .foregroundColor(Color("black2"))
            }
            
            HStack{
                Image("key")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(.leading, 16)
                
                if signInVM.showPassword{
                    TextField("security code",text: $signInVM.password)
                        .background(.clear)
                        .foregroundColor(Color("white2"))
                        .focused($showKeyborad)
                }else {
                    SecureField("security code", text: $signInVM.password)
                        .background(.clear)
                        .foregroundColor(.black)
                        .focused($showKeyborad)
                }
                Image(signInVM.showPassword ? "eye2" : "eye")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(.trailing, 10)
                    .onTapGesture {
                        withAnimation(.spring().speed(2)){
                            signInVM.showPassword.toggle()
                        }
                    }
            }
        }
        .frame(width: SCREEN_WIDTH-40, height: 48)
        .background(Color("white2"))
        .cornerRadius(12)
    }
    
    @ViewBuilder
    private func signInBtn() -> some View{
        Button(
            action: {
                if checkCompletion(){
                    login(signInVM.tel, signInVM.password)
                }else {
                    setAlert("Please enter complete information.", "red")
                }
            }){
                Text("sign in")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color(signInVM.light ? "black2" : "white2"))
                    .frame(width: SCREEN_WIDTH-80, height: 48)
                    .background(Color(signInVM.light ? "green4" : "green3"))
                    .cornerRadius(32)
                    
            }
    }
    
    @ViewBuilder
    private func signUpBtn() -> some View{
        Button(
            action: {
                signInVM.goRegister = true
            }){
                Text("sign up")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color("white2"))
                    .frame(width: SCREEN_WIDTH-80, height: 48)
                    .background(Color("green3"))
                    .cornerRadius(32)
            }
            
    }
    @ViewBuilder
    private func wx() -> some View{
        Image("wx")
            .resizable()
            .frame(width: 40, height: 40)
    }
    
    @ViewBuilder
    private func qq() -> some View{
        Image("qq")
            .resizable()
            .frame(width: 40, height: 40)
    }
}
