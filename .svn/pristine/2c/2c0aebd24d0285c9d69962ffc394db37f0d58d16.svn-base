package com.atyou.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atyou.common.EasyUITreeNode;
import com.atyou.dao.CategoryMapper;
import com.atyou.dao.ParentCategoryMapper;
import com.atyou.pojo.Category;
import com.atyou.pojo.CategoryExample;
import com.atyou.pojo.ParentCategory;
import com.atyou.pojo.ParentCategoryExample;
import com.atyou.pojo.CategoryExample.Criteria;
import com.atyou.service.AdminService;
/**
 * 商品分类管理
 * @author Administrator
 *
 */
@Service
public class AdminServiceImpl implements AdminService{


	@Autowired
	private CategoryMapper categoryMapper;
	@Autowired
	private ParentCategoryMapper ParentCategoryMapper;
	
	@Override
	public List<EasyUITreeNode> getItemCatList(Integer parentId) throws Exception {
		//根据父节点让id查询子节点列表
		CategoryExample example = new CategoryExample();
		//设置查询条件
		Criteria criteria = example.createCriteria();
		criteria.andParentIdEqualTo(parentId);
		//执行查询
		List<Category> list = categoryMapper.selectByExample(example);

		//转换成EasyUITreeNode列表
		List<EasyUITreeNode> resultList = new ArrayList<>();
		/*for (TbItemCat tbItemCat : list) {
			EasyUITreeNode node = new EasyUITreeNode();
			node.setId(tbItemCat.getId());
			node.setText(tbItemCat.getName());
			//如果节点下有子节点 “closed” 如果没有子节点 “open”
			node.setState(tbItemCat.getIsParent()?"closed":"open");
			//添加到节点列表
			resultList.add(node);
		}*/
		for (Category category : list) {
			EasyUITreeNode node = new EasyUITreeNode();
			node.setId(category.getId());
			node.setText(category.getCategory());
			node.setState(category.getIsParent()?"closed":"open");
			resultList.add(node);
		}
		return resultList;
	}

	@Override
	public List<EasyUITreeNode> getItemCatList2(Integer parentId) throws Exception {
		//根据父节点让id查询子节点列表
				ParentCategoryExample example = new ParentCategoryExample();
				//设置查询条件
				
				//执行查询
				List<ParentCategory> list = ParentCategoryMapper.selectByExample(example);

				//转换成EasyUITreeNode列表
				List<EasyUITreeNode> resultList = new ArrayList<>();
				/*for (TbItemCat tbItemCat : list) {
					EasyUITreeNode node = new EasyUITreeNode();
					node.setId(tbItemCat.getId());
					node.setText(tbItemCat.getName());
					//如果节点下有子节点 “closed” 如果没有子节点 “open”
					node.setState(tbItemCat.getIsParent()?"closed":"open");
					//添加到节点列表
					resultList.add(node);
				}*/
				for (ParentCategory category : list) {
					EasyUITreeNode node = new EasyUITreeNode();
					node.setId(category.getId());
					node.setText(category.getCategory());
					node.setState("open");
					resultList.add(node);
				}
				return resultList;
	}
}
