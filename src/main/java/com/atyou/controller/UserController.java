package com.atyou.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atyou.common.ServerResponse;
import com.atyou.pojo.User;
import com.atyou.service.UserService;

@Controller
@RequestMapping("/user/")
public class UserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("get_one.do")
    @ResponseBody
	public ServerResponse<User> getOne() {
		
		User user =userService.selectByPrimaryKey(1);
		if (user!=null) {
			return ServerResponse.createBySuccess("查询成功！", user);
		}
		return ServerResponse.createByErrorMessage("未能查到数据！");
	}
	
	@RequestMapping(value="test.do")
	public String shopManagement(){
		return "index";
	}

}
