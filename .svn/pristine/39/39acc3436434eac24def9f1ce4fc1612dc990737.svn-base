package com.atyou.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atyou.common.EasyUITreeNode;
import com.atyou.common.TaotaoResult;
import com.atyou.service.CatgoryManageService;

/**
 * 新闻目录管理
 * @author 赵玉龙
 */
@Controller
@RequestMapping("/content/category")
public class CatgoryManageController {
	
	@Autowired
	private CatgoryManageService catgoryManageService;
	
	//查询目录列表
	@RequestMapping("/list")
	@ResponseBody
	public List<EasyUITreeNode> getCatgoryCatList(@RequestParam(value="id",defaultValue="0")Integer parentId){
		List<EasyUITreeNode> list = catgoryManageService.getCatgoryCatList(parentId);
		return list;
	}
	
	//添加目录
	@RequestMapping("/create")
	@ResponseBody
	public TaotaoResult createNode(Integer parentId, String category) {
		TaotaoResult result = catgoryManageService.insertCatgory(parentId, category);
		return result;
	}
	
	//修改目录的名称
	@RequestMapping("/update")
	@ResponseBody
	public TaotaoResult renameCategory(Integer id, String category) {
		TaotaoResult taotaoResult = catgoryManageService.renameCatgory(id, category);
		return taotaoResult;
	}
	
	//删除目录
	@RequestMapping("/delete")
	@ResponseBody
	private TaotaoResult deleteNode(Integer id) {
		TaotaoResult taotaoResult = catgoryManageService.deleteCategory(id);		
		return taotaoResult;
	}
	
	
	
	
}




















