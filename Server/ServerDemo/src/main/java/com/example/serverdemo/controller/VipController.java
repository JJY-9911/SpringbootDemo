package com.example.serverdemo.controller;

import com.example.serverdemo.entity.UserInfo;
import com.example.serverdemo.service.BeVipService;
import com.example.serverdemo.service.CheckService;
import com.example.serverdemo.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class VipController {
    @Autowired
    private BeVipService beVipService;
    @Autowired
    private CheckService checkService;
    @PostMapping("/bevip")
    public String beVip(@RequestParam String name, @RequestParam Integer id) {
        if (checkService.check(name)) {
            if (true) {
                beVipService.beVip(name, id);
                return "成为vip！";
            }else {
                return "已经是vip";
            }
        } else {
            return "用户不存在";
        }

    }
}
