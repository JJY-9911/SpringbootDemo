package com.example.serverdemo.controller;

import com.example.serverdemo.entity.SignInResponse;
import com.example.serverdemo.entity.UserInfo;
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
    @PostMapping("/login")
    public SignInResponse login(@RequestBody UserInfo userInput){
        Map<String, Object> map = new HashMap<>();
        UserInfo queryResult = loginService.login(userInput.getName(), userInput.getPassword());
        if (queryResult != null){
            return SignInResponse.success(queryResult);
        }else {
            return SignInResponse.fail();
        }
    }
}
