package com.atyou.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atyou.dao.DetailMapper;
import com.atyou.pojo.Detail;
import com.atyou.pojo.DetailExample;
import com.atyou.pojo.DetailExample.Criteria;
import com.atyou.service.WebItemService;

@Service
public class WebItemServiceImpl implements WebItemService {

	@Autowired
	private DetailMapper detailMapper;
	
	@Override
	public List<Detail> getItemList(Integer cateId,Integer parentCateId) {
		DetailExample example = new DetailExample();
		Criteria criteria = example.createCriteria();
		if (cateId != 0) {
			criteria.andCategoryIdEqualTo(cateId);
		}
		if (parentCateId != 0) {
			criteria.andParentCategoryIdEqualTo(parentCateId);
		}
		List<Detail> list = detailMapper.selectByExample(example);
		return list;
	}

}
