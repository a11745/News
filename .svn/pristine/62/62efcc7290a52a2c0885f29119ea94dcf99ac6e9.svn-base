package com.atyou.service;

import java.util.Map;

import com.atyou.pojo.User;

public interface UserService {

	User selectByPrimaryKey(Integer id);
	
	//用户注册
	Map<String, String> register(String phone, String identifyCode, String password);
	
	//验证码
	void sendVerifyCode(String phone);
	
}
