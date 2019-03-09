package com.atyou.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atyou.common.TaotaoResult;
import com.atyou.pojo.Detail;
import com.atyou.service.ItemService;

/**
 * 商品管理
 * @author Administrator
 *
 */
@Controller
public class ItemController {
	@Autowired
	private  ItemService itemService;
	
	
	@RequestMapping(value="/item/save",method=RequestMethod.POST)
	@ResponseBody
	public TaotaoResult addItem(Detail item,String desc) throws Exception{
		TaotaoResult result = itemService.addItem(item, desc);
		return result;
	}
	@RequestMapping(value="/rest/item/update",method=RequestMethod.POST)
	@ResponseBody
	public TaotaoResult updateItem(Detail item,String desc) throws Exception{
		TaotaoResult result = itemService.updateItem(item, desc);
		return result;
	}
	
}
