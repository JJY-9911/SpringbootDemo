package com.example.serverdemo.service.serviceImpl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.serverdemo.entity.UserInfo;
import com.example.serverdemo.mapper.UserMapper;
import com.example.serverdemo.service.BeVipService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

@Service
public class BeVipServiceImpl extends ServiceImpl<UserMapper, UserInfo> implements BeVipService {
    @Resource
    private UserMapper userMapper;
    @Override
    public void beVip(String tel, Integer id) {
        userMapper.update(tel, id);
    }
}
