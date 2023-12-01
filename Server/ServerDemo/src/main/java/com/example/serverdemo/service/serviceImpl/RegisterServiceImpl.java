package com.example.serverdemo.service.serviceImpl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.serverdemo.entity.UserInfo;
import com.example.serverdemo.mapper.UserMapper;
import com.example.serverdemo.service.RegisterService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

@Service
public class RegisterServiceImpl extends ServiceImpl<UserMapper, UserInfo> implements RegisterService {
    @Resource
    private UserMapper userMapper;
    @Override
    public Boolean register(UserInfo userInfo) {
        userMapper.insert(userInfo.getTel(), userInfo.getPassword());
        return true;
    }
}
