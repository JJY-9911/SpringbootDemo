package com.example.serverdemo.service.serviceImpl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.serverdemo.entity.UserInfo;
import com.example.serverdemo.mapper.UserMapper;
import com.example.serverdemo.service.LoginService;
import jakarta.annotation.Resource;
import org.apache.catalina.User;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.Map;
import java.util.Optional;
import java.util.function.Function;
@Service

public class LoginServiceImpl extends ServiceImpl<UserMapper, UserInfo> implements LoginService {
    @Resource
    private UserMapper userMapper;
    @Override
    public UserInfo login(String tel, String password) {
        UserInfo userInfo = userMapper.select(tel, password);
        System.out.println(userInfo);
        return userInfo;
    }
}
