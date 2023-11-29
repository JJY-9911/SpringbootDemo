package com.example.serverdemo.controller;

import com.example.serverdemo.entity.UserInfo;
import com.example.serverdemo.service.ListService;
import com.example.serverdemo.service.RegisterService;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class TestController {

    @GetMapping("/test")
    public String test(){
        return "test success!";
    }
    @Autowired
    private ListService listService;
    @GetMapping("/list")
    public List<UserInfo> list(){
        return listService.listUsers();
    }

}
