package com.atyou.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atyou.common.EasyUIDataGridResult;
import com.atyou.common.TaotaoResult;
import com.atyou.dao.DetailMapper;
import com.atyou.pojo.Detail;
import com.atyou.pojo.DetailExample;
import com.atyou.service.AdminItemQueryService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class AdminItemQueryServiceImpl implements AdminItemQueryService {

		@Autowired
		private DetailMapper detailMapper;
		
		@Override
		public EasyUIDataGridResult getItemList(int page, int rows) throws Exception {
			//设置分页信息
			PageHelper.startPage(page, rows);
			//执行查询
			DetailExample example = new DetailExample();
			List<Detail> list = detailMapper.selectByExample(example);
			//取查询结果
			PageInfo<Detail> pageInfo = new PageInfo<>(list);
			EasyUIDataGridResult result = new EasyUIDataGridResult();
			result.setTotal(pageInfo.getTotal());
			result.setRows(list);
			return result;
		}

		@Override
		public TaotaoResult updateContent(Detail detail) throws Exception {
			Detail content = detailMapper.selectByPrimaryKey(detail.getId());
			detail.setCreateTime(content.getCreateTime());
			detail.setUpdateTime(new Date());
			detailMapper.updateByPrimaryKey(detail);
			return TaotaoResult.ok();
		}
		
		@Override
		public TaotaoResult delContent(List<Integer> ids) throws Exception {
			/*TbContentExample example = new TbContentExample();
			Criteria criteria = example.createCriteria();
			criteria.andCategoryIdIn(ids);
			contentMapper.deleteByExample(example);*/
			for (Integer long1 : ids) {
				//Detail content = detailMapper.selectByPrimaryKey(long1);
				detailMapper.deleteByPrimaryKey(long1);	
			}			
			return TaotaoResult.ok();
		}

		

}
