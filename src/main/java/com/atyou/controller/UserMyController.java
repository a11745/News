package com.atyou.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.atyou.common.JSONResult;
import com.atyou.pojo.Detail;
import com.atyou.pojo.UserInfo;
import com.atyou.service.DetailService;
import com.atyou.service.UserMyService;
import com.atyou.util.UploadUtil;
import com.github.pagehelper.PageInfo;

@Controller
public class UserMyController {
	
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private DetailService detailService;
	@Autowired
	private UserMyService userMyService;
	
	@RequestMapping("/pwd")
	public String pwd(HttpServletRequest request) {
		if (request.getSession().getAttribute("user")==null) {
			return "/login";
		}
		return "pwd";
	}
	@RequestMapping("/comments")
	public String comments(HttpServletRequest request,@RequestParam(required = false,defaultValue = "1",value = "pn")Integer pn,Model model) throws Exception{
		if (request.getSession().getAttribute("user")==null) {
			return "/login";
		}
		UserInfo uInfo = (UserInfo) request.getSession().getAttribute("user");
		PageInfo pageInfo = detailService.userCommentPage(pn,uInfo.getId());
		model.addAttribute("pageInfo", pageInfo);
		return "comments";
	}
	@RequestMapping("/loginlog")
	public String loginlog(HttpServletRequest request,@RequestParam(required = false,defaultValue = "1",value = "pn")Integer pn,Model model) throws Exception {
		if (request.getSession().getAttribute("user")==null) {
			return "/login";
		}
		UserInfo uInfo = (UserInfo) request.getSession().getAttribute("user");
		PageInfo pageInfo = userMyService.ipPage(pn,uInfo.getId());
		model.addAttribute("pageInfo", pageInfo);
		return "loginlog";
	}
	@RequestMapping("/moviecol")
	public String moviecol(HttpServletRequest request,@RequestParam(required = false,defaultValue = "1",value = "pn")Integer pn,Model model) throws Exception {
		if (request.getSession().getAttribute("user")==null) {
			return "/login";
		}
		UserInfo uInfo = (UserInfo) request.getSession().getAttribute("user");
		PageInfo pageInfo = userMyService.colPage(pn, uInfo.getId());
		model.addAttribute("pageInfo", pageInfo);
		return "moviecol";
	}
	
	/**
	 * 文件上传
	 */
	@RequestMapping("headImageUpload")
	@ResponseBody
	public String realAuthUpload(MultipartFile file){
		//先得到basepath文件的绝对路径
		String basePath = servletContext.getRealPath("/upload");//会上传到webapp下的upload文件夹
		String filename = UploadUtil.upload(file, basePath);
		System.out.println("/upload/"+filename);
		return "/upload/"+filename;
		
	}
	
	
	@RequestMapping("/useredit")
	@ResponseBody
	public JSONResult userEdit(UserInfo userInfo,Model model) throws Exception {
			JSONResult jsonResult = new JSONResult();
			Boolean result = userMyService.useredit(userInfo);
		
			if (result) {
				jsonResult.setSuccess(true);
				jsonResult.setMsg("登陆成功！！！");
				
				return jsonResult;
			}
			
			jsonResult.setMsg("登陆失败,请检查后重试");
			jsonResult.setSuccess(false);
			return jsonResult;
		}
	
}
