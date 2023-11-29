package com.example.serverdemo.entity;

import lombok.Data;
import org.apache.catalina.User;

import java.io.Serializable;

@Data
public class SignInResponse implements Serializable {
    private Integer code;
    private String msg;
    private UserInfo userInfo;

    public static SignInResponse success(UserInfo userInfo){
        SignInResponse signInResponse = new SignInResponse();
        signInResponse.setCode(0);
        signInResponse.setMsg("sign in success");
        signInResponse.setUserInfo(userInfo);
        return signInResponse;
    }
    public static SignInResponse fail(){
        SignInResponse signInResponse = new SignInResponse();
        signInResponse.setCode(1);
        signInResponse.setMsg("no user, please sign up");
        return signInResponse;
    }
}
