package com.example.serverdemo.controller;

import com.example.serverdemo.entity.SignUpResponse;
import com.example.serverdemo.entity.UserInfo;
import com.example.serverdemo.service.CheckService;
import com.example.serverdemo.service.LoginService;
import com.example.serverdemo.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RegisterController {
    @Autowired
    private RegisterService registerService;

    @Autowired
    private CheckService checkService;
    @PostMapping("/register")
    public SignUpResponse register(@RequestBody UserInfo userInfo){
        UserInfo u = checkService.check(userInfo.getTel());
        if(u == null){
            registerService.register(userInfo);
            u = checkService.check(userInfo.getTel());//返回注册成功的账户
            return SignUpResponse.success(u);
        }else {
            return SignUpResponse.fail();
        }
    }
}
