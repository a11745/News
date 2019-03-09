package com.atyou.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atyou.common.JSONResult;
import com.atyou.service.UserService;

//验证码相关的controller
@Controller
public class VerifyCodeController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("sendVerifyCode")
	@ResponseBody
	public JSONResult sendVerifyCode(String phonenumber) {
		JSONResult json = new JSONResult();
		try {
			//System.out.println(phonenumber);
			userService.sendVerifyCode(phonenumber);
		} catch (RuntimeException e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
			
		}
		return json;
	}
	
	
	@RequestMapping("register")
	@ResponseBody
	public Map<String, String> register(String phone, String identifyCode, String password) {
		return this.userService.register(phone, identifyCode, password);
	}
	
}
























