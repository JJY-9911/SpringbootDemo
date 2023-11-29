package com.example.serverdemo.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.serverdemo.entity.UserInfo;

public interface RegisterService extends IService<UserInfo> {
    Boolean register(UserInfo userInfo);
}
