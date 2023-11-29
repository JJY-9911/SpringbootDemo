package com.example.serverdemo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.Serializable;

//表
@Data
@TableName("user_info")
public class UserInfo {
    @TableId(value = "id")
    private Integer id;
    private String name;
    private String password;
    private int vip;

}

