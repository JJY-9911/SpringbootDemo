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
    struct User: Encodable {
        let name: String
        let password: String
    }
    
    var body: some View {
        NavigationView(){
            ZStack{
                Color("brown2")
                VStack{
                    Spacer()
                    HStack{
                        welcome()
                            .padding(.leading, 20)
                        Spacer()
                    }
                    nameInput()
                    passwordInput()
                    Spacer()
                    signInBtn()
                        .padding(.bottom, 20)
                    signUpBtn()
                    Spacer()
                    qq()
                    Spacer()
                }
                
                NavigationLink(destination: MainView(), isActive: $signInVM.go){
                    EmptyView()
                }
                
                NavigationLink(destination: RegisterView(), isActive: $signInVM.goRegister){
                    EmptyView()
                }
                
            }
            .ignoresSafeArea()
        }
    }
    
    func login( _ name: String, _ password: String) {
        let action: String = SERVER_IP + "/login"
        let param = User(name: name, password: password)
        AF.request(
        action,
        method: .post,
        parameters: param,
        encoder: JSONParameterEncoder.default
        ).responseString(encoding: .utf8){response in
            debugPrint(response)
            switch(response.result){
            case .success(let str):
                parseResponse(str)
                break
            case .failure(let error):
                break
            }
        }
    }
    
    func parseResponse(_ responseString: String){
        print("responseString:\(responseString)")
        
    }
   
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

extension SignInView{
    @ViewBuilder
    private func welcome() -> some View{
        Text("Welcome")
            .foregroundColor(Color("gray"))
            .font(.system(size: 56, weight: .heavy))
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
            TextField("name",text: $signInVM.name)
                .background(.clear)
                .foregroundColor(.black)
                .padding(.horizontal, 20)
        }
        .frame(width: SCREEN_WIDTH-40, height: 48)
        .background(Color("white"))
        .cornerRadius(12)
        
    }
    
    @ViewBuilder
    private func passwordInput() -> some View{
        ZStack(alignment: .center){
            TextField("password",text: $signInVM.password)
                .background(.clear)
                .foregroundColor(.black)
                .padding(.horizontal, 20)
        }
        .frame(width: SCREEN_WIDTH-40, height: 48)
        .background(Color("white"))
        .cornerRadius(12)
    }
    
    @ViewBuilder
    private func signInBtn() -> some View{
        Button(
            action: {
                login(signInVM.name, signInVM.password)
            }){
                Text("sign in")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color("white"))
                    .frame(width: SCREEN_WIDTH-80, height: 48)
                    .background(Color("green2"))
                    .cornerRadius(32)
            }
    }
    
    @ViewBuilder
    private func signUpBtn() -> some View{
        Button(
            action: {
                
            }){
                Text("sign up")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color("white"))
                    .frame(width: SCREEN_WIDTH-80, height: 48)
                    .background(Color("red2"))
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
