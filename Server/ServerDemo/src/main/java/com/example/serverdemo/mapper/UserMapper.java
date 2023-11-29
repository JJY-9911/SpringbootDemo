package com.example.serverdemo.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.serverdemo.entity.UserInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

//sql语句的映射
@Mapper
public interface UserMapper extends BaseMapper<UserInfo> {
    List<UserInfo> selectAll();
    UserInfo select(String name, String password);
    UserInfo check(String name);
    Boolean insert(String name, String password);
    Boolean update(String name, Integer id);
    Boolean delete(String name, String password);
}
