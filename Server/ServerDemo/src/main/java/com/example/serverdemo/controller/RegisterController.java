package com.example.serverdemo.controller;

import com.example.serverdemo.entity.UserInfo;
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
    @PostMapping("/register")
    public void register(@RequestBody UserInfo userInfo){
        registerService.register(userInfo);
    }
}
