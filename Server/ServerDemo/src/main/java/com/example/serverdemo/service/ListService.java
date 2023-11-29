package com.example.serverdemo.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.serverdemo.entity.UserInfo;

import java.util.List;


public interface ListService extends IService<UserInfo> {

    List<UserInfo> listUsers();
    UserInfo select(String name, String password);
}
