package com.atyou.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atyou.dao.CategoryMapper;
import com.atyou.dao.DetailMapper;
import com.atyou.dao.ParentCategoryMapper;
import com.atyou.pojo.Category;
import com.atyou.pojo.CategoryExample;
import com.atyou.pojo.CategoryExample.Criteria;
import com.atyou.pojo.Detail;
import com.atyou.pojo.DetailExample;
import com.atyou.pojo.ParentCategory;
import com.atyou.pojo.ParentCategoryExample;
import com.atyou.service.WebCategoryService;

@Service
public class WebCategoryServiceImpl implements WebCategoryService{
	
	@Autowired
	private CategoryMapper categoryMapper;
	@Autowired
	private ParentCategoryMapper parentCategoryMapper;
	@Autowired
	private DetailMapper detailMapper;

	@Override
	public List<Category> queryCate() {
		CategoryExample example = new CategoryExample();
		Criteria criteria = example.createCriteria();
		//criteria.andIdEqualTo(id);
		List<Category> list = categoryMapper.selectByExample(example);
		return list;
	}

	@Override
	public List<ParentCategory> queryParentCate() {
		ParentCategoryExample example = new ParentCategoryExample();
		com.atyou.pojo.ParentCategoryExample.Criteria criteria = example.createCriteria();
		//criteria.andIdEqualTo(id);
		List<ParentCategory> list = parentCategoryMapper.selectByExample(example);
		return list;
	}

	@Override
	public List<Detail> searchNewsbyTitle(String title) {
		//DetailExample example = new DetailExample();
		//com.atyou.pojo.DetailExample.Criteria criteria = example.createCriteria();
		List<Detail> list = detailMapper.searchByTitle(title);
		return list;
	}
	
		
}
