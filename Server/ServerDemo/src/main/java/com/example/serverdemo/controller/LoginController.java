package com.example.serverdemo.controller;

import com.example.serverdemo.entity.SignInResponse;
import com.example.serverdemo.entity.UserInfo;
import com.example.serverdemo.service.CheckService;
import com.example.serverdemo.service.LoginService;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class LoginController {
    @Autowired
    private LoginService loginService;

    @Autowired
    private CheckService checkService;
    @PostMapping("/login")
    public SignInResponse login(@RequestBody UserInfo userInput){
        UserInfo queryResult = loginService.login(userInput.getTel(), userInput.getPassword());
        if (queryResult != null){
            return SignInResponse.success(queryResult);
        }else {//判断是用户不存在还是密码错误
            queryResult = checkService.check(userInput.getTel());
            if (queryResult == null){
                return SignInResponse.noUser();
            }else {
                return SignInResponse.codeWrong();
            }

        }
    }
}
