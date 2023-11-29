package com.example.serverdemo.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.serverdemo.entity.UserInfo;

public interface LoginService extends IService<UserInfo> {
    UserInfo login(String name, String password);
}
