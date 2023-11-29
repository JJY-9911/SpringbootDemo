package com.example.serverdemo.service.serviceImpl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.serverdemo.entity.UserInfo;
import com.example.serverdemo.mapper.UserMapper;
import com.example.serverdemo.service.CheckService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

@Service
public class CheckServiceImpl extends ServiceImpl<UserMapper, UserInfo> implements CheckService {
    @Resource
    private UserMapper userMapper;
    @Override
    public boolean check(String name) {
        UserInfo u = userMapper.check(name);
        System.out.println(u.getName());
        return true;
    }
}
