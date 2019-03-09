package com.atyou.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
/**
 * 后台管理Controller
 * @author Administrator
 *
 */
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atyou.common.EasyUITreeNode;
import com.atyou.service.AdminService;
@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/admin")
	public String adminManager() {
		return "index";
	}
	@RequestMapping("/item-add")
	public String showadd() throws Exception{
		return "item-add";
	}
	@RequestMapping("/item-list")
	public String showlist() throws Exception{
		return "item-list";
	}
	@RequestMapping("/item-param-list")
	public String showparamlist() throws Exception{
		return "item-param-list";
	}
	@RequestMapping("/content-category")
	public String showcategory() throws Exception{
		return "content-category";
	}
	@RequestMapping("/content")
	public String showcontent() throws Exception{
		return "content";
	}
	@RequestMapping("/import-index")
	public String showimportindex() throws Exception{
		return "import-index";
	}
	/**
	 * 商品分类管理
	 * @author Administrator
	 *
	 */
	@RequestMapping("/item/cat/list")
	@ResponseBody
	public List<EasyUITreeNode> getItemCatList(@RequestParam(name="id",defaultValue="0")Integer parentId) throws Exception{
		List<EasyUITreeNode> list = adminService.getItemCatList(parentId);
		return list;
	}
	/**
	 * 商品分类管理
	 * @author Administrator
	 *
	 */
	@RequestMapping("/item/cat/list2")
	@ResponseBody
	public List<EasyUITreeNode> getItemCatList2(@RequestParam(name="id",defaultValue="0")Integer parentId) throws Exception{
		List<EasyUITreeNode> list = adminService.getItemCatList2(parentId);
		return list;
	}
}
