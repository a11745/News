package com.atyou.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
/**
 * 登录
 * @author Administrator
 *
 */
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atyou.common.JSONResult;
import com.atyou.pojo.UserInfo;
import com.atyou.service.LoginService;
@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;
	
	@RequestMapping("/weblogin")
	@ResponseBody
	public JSONResult Login(String phone,String password,HttpServletRequest request)throws Exception {
		JSONResult jsonResult = new JSONResult();
		Boolean result = loginService.login(phone, password,request.getLocalAddr());
		UserInfo user = loginService.selectUser(phone);
		if (result) {
			jsonResult.setSuccess(true);
			jsonResult.setMsg("登陆成功！！！");
			if (user!=null) {
				request.getSession().setAttribute("user", user);
			}else {
				jsonResult.setMsg("登陆失败,请检查后重试");
				jsonResult.setSuccess(false);
				return jsonResult;
			}
			return jsonResult;
		}
		
		jsonResult.setMsg("登陆失败,请检查后重试");
		jsonResult.setSuccess(false);
		return jsonResult;
	}
	/*@RequestMapping("/weblogin")
	public String Login(String phone,String password,Model model)throws Exception {
		JSONResult jsonResult = new JSONResult();
		Boolean result = loginService.login(phone, password);
		if (result) {
			jsonResult.setSuccess(true);
			jsonResult.setMsg("登陆成功");
			return "/webindex";
		}
		jsonResult.setMsg("登陆失败");
		jsonResult.setSuccess(false);
		model.addAttribute("msg", "登录失败，请重新登录");
		return "redirect:/login";
	}*/
}
