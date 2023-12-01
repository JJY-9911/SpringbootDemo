package com.example.serverdemo.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.serverdemo.entity.UserInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

//sql语句的映射
@Mapper
public interface UserMapper extends BaseMapper<UserInfo> {
    List<UserInfo> selectAll();
    //登陆验证
    UserInfo select(String tel, String password);
    //查重
    UserInfo check(String tel);
    //注册
    Boolean insert(String tel, String password);
    //成为vip
    Boolean update(String tel, Integer id);
    //注销
    Boolean delete(String tel, String password);
}
