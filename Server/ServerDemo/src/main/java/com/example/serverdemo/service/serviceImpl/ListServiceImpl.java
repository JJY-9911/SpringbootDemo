package com.example.serverdemo.service.serviceImpl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.serverdemo.entity.UserInfo;
import com.example.serverdemo.mapper.UserMapper;
import com.example.serverdemo.service.ListService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

//具体的业务，对sql语句映射的组合应用
@Service
public class ListServiceImpl extends ServiceImpl<UserMapper, UserInfo> implements ListService {

    @Resource
    private UserMapper userMapper;
    @Override
    public List<UserInfo> listUsers() {
        return userMapper.selectAll();
    }

    @Override
    public UserInfo select(String name, String password) {
        return userMapper.select(name, password);
    }
}
