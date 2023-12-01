package com.example.serverdemo.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.serverdemo.entity.UserInfo;

import java.time.InstantSource;

public interface BeVipService extends IService<UserInfo> {
    void beVip(String tel, Integer id);
}
