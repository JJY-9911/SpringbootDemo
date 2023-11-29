package com.example.serverdemo;


import com.example.serverdemo.entity.UserInfo;
import org.apache.catalina.User;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;


@SpringBootApplication
public class ServerDemoApplication {
	public static void main(String[] args) {

		SpringApplication.run(ServerDemoApplication.class, args);
		System.out.println("【Springboot Started】");
	}
}
