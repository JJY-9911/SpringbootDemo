package com.example.serverdemo.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class SignUpResponse implements Serializable {
    private Integer code;
    private String msg;
    private UserInfo userInfo;

    public static SignUpResponse success(UserInfo userInfo){
        SignUpResponse signUpResponse = new SignUpResponse();
        signUpResponse.setCode(0);
        signUpResponse.setMsg("sign up success");
        signUpResponse.setUserInfo(userInfo);
        return  signUpResponse;
    }

    public static SignUpResponse fail(){
        SignUpResponse signUpResponse = new SignUpResponse();
        signUpResponse.setCode(1);
        signUpResponse.setMsg("Account already exists.");
        return  signUpResponse;
    }
}
