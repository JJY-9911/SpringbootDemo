package com.example.serverdemo.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.serverdemo.entity.UserInfo;

public interface CheckService extends IService<UserInfo> {
    boolean check(String name);
}
