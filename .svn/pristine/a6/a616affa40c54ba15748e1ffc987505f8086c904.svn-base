package com.atyou.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atyou.common.JSONResult;
import com.atyou.pojo.Comment;
import com.atyou.pojo.CommentResult;
import com.atyou.pojo.Detail;
import com.atyou.query.CommentQueryObject;
import com.atyou.query.PageResult;
import com.atyou.service.DetailService;
import com.github.pagehelper.PageInfo;

@Controller
public class DetailController {
	
	
	@Autowired
	private DetailService detailService;
	
	
	/*@RequestMapping("/details")
	public String webdetail(@RequestParam(value="itemId",defaultValue="1")Integer itemId,Model model,@ModelAttribute("qo")CommentQueryObject qo)throws Exception {
		Detail detail = detailService.queryDetail(itemId);
		PageResult result = detailService.commentList(qo);
		model.addAttribute("detail", detail);
		model.addAttribute("pageResult", result);
		return "details";
	}*/
	@RequestMapping("/details")
	public String webdetail(@RequestParam(value="itemId",defaultValue="1")Integer itemId,Model model,@RequestParam(required = false,defaultValue = "1",value = "pn")Integer pn)throws Exception {
		Detail detail = detailService.queryDetail(itemId);
		System.out.println(pn);
		PageInfo pageInfo = detailService.commentPage(pn,itemId);
		List<CommentResult> commentList = detailService.commentList(itemId);
		
		model.addAttribute("detail", detail);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("commentList", commentList);
		return "details";
	}
	
	@RequestMapping("/addcomment")
	@ResponseBody
	public JSONResult addComment(Comment comment,Model model,HttpServletRequest request)throws Exception{
		System.out.println(comment.getUserId());
		System.out.println(comment.getContent());
		System.out.println(comment.getDetailId());
		JSONResult jsonResult = new JSONResult();
		if (request.getSession().getAttribute("user")!=null) {
			Boolean addComment = detailService.addComment(comment);
			if (addComment) {
				jsonResult.setSuccess(true);
				jsonResult.setMsg("评论成功！！！");
				return jsonResult;
			}
			jsonResult.setMsg("评论失败,请检查后重试");
			jsonResult.setSuccess(false);
			return jsonResult;
		}
		jsonResult.setMsg("评论失败,请检查后重试");
		jsonResult.setSuccess(false);
		return jsonResult;
	}
	
	@RequestMapping("/addcol")
	@ResponseBody
	public JSONResult addcol(Comment comment,Model model,HttpServletRequest request)throws Exception{
		System.out.println(comment.getUserId());
		System.out.println(comment.getContent());
		System.out.println(comment.getDetailId());
		JSONResult jsonResult = new JSONResult();
		if (request.getSession().getAttribute("user")!=null) {
			Boolean addComment = detailService.addCol(comment);
			if (addComment) {
				jsonResult.setSuccess(true);
				jsonResult.setMsg("收藏成功！！！");
				return jsonResult;
			}
			jsonResult.setMsg("收藏失败,请检查后重试");
			jsonResult.setSuccess(false);
			return jsonResult;
		}
		jsonResult.setMsg("评论失败,请检查后重试");
		jsonResult.setSuccess(false);
		return jsonResult;
	}
}
