package com.atyou.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.spel.ast.Identifier;
import org.springframework.stereotype.Service;

import com.atyou.common.EasyUITreeNode;
import com.atyou.common.TaotaoResult;
import com.atyou.dao.CategoryMapper;
import com.atyou.pojo.Category;
import com.atyou.pojo.CategoryExample;
import com.atyou.pojo.CategoryExample.Criteria;
import com.atyou.service.CatgoryManageService;
import com.fasterxml.jackson.core.sym.Name;

/**
 * 新闻目录管理
 * @author 赵玉龙
 */

@Service
public class CatgoryManageServiceImpl implements CatgoryManageService{
	
	@Autowired
	private CategoryMapper categoryMapper;

	//返回目录列表
	@Override
	public List<EasyUITreeNode> getCatgoryCatList(Integer parentId) {
		//根据parentId查询子节点列表
		CategoryExample example = new CategoryExample();
		Criteria criteria = example.createCriteria();
		criteria.andParentIdEqualTo(parentId);
		//执行查询
		List<Category> list = categoryMapper.selectByExample(example);
		//转换成EasyUITreeNode列表
		List<EasyUITreeNode> resultList = new ArrayList<>();
		for (Category category : list) {
			//创建一个节点
			EasyUITreeNode node = new EasyUITreeNode();
			node.setId(category.getId());
			node.setText(category.getCategory());
			node.setState(category.getIsParent() ? "closed" : "open");
			//添加到列表
			resultList.add(node);
		}
		return resultList;
		
	}

	//新增新闻目录
	@Override
	public TaotaoResult insertCatgory(Integer parentId, String category) {
		//创建一个pojo对象
		Category catgory = new Category();
		catgory.setCategory(category);
		catgory.setParentId(parentId);
		catgory.setIsParent(false);
		//插入数据
		categoryMapper.insert(catgory);
		//取返回的主键
		Integer id = catgory.getId();
		//判断父节点的isparent属性
		//查询父节点
		Category parentNode = categoryMapper.selectByPrimaryKey(parentId);
		if(!parentNode.getIsParent()) {
			parentNode.setIsParent(true);
			//更新父节点
			categoryMapper.updateByPrimaryKey(parentNode);
		}
		//返回主键
		return TaotaoResult.ok(id);
	}

	//更新目录名
	@Override
	public TaotaoResult renameCatgory(Integer id, String catgory) {
		// 根据id查询目标目录
		Category category = categoryMapper.selectByPrimaryKey(id);
		//判断名字是否重复和存在
		if (catgory != null && catgory.equals(category.getCategory())) {
			return TaotaoResult.ok();
		}
		//设置修改后的名字
		category.setCategory(catgory);
		categoryMapper.updateByPrimaryKey(category);
		return TaotaoResult.ok();

	}

	//删除目录
	@Override
	public TaotaoResult deleteCategory(Integer id) {
		deleteCategoryAndChildNode(id);
		return TaotaoResult.ok();
	}
	
	public void deleteCategoryAndChildNode(Integer id) {
		// 获取要删除的Category
		Category category = categoryMapper.selectByPrimaryKey(id);
		// 判断是否是父节点
		if (category.getIsParent()) {
			// 获取该节点下的孩子节点
			List<Category> list = getChildNodeList(id);
			//删除所有孩子节点
			for (Category catgory : list) {
				deleteCategoryAndChildNode(catgory.getId());
			}
		}	
		//判断父节点下是否还有其他子节点
		if (getChildNodeList(category.getParentId()).size() == 1) {
			Category parentCategory = categoryMapper.selectByPrimaryKey(category.getParentId());
			parentCategory.setIsParent(false);
			categoryMapper.updateByPrimaryKey(parentCategory);
		}
		categoryMapper.deleteByPrimaryKey(id);
	}
	
	public List<Category> getChildNodeList(Integer id) {
		//查询所有父节点为传入id的结点
		CategoryExample example = new CategoryExample();
		Criteria criteria = example.createCriteria();
		criteria.andParentIdEqualTo(id);
		//返回所有符合要求的结点
		return categoryMapper.selectByExample(example);
	}
	
	

	/*//删除目录
	@Override
	public TaotaoResult deleteCategory(Integer id) {
		//查询出id值的对象信息
		Category category = categoryMapper.selectByPrimaryKey(id);
		//状态值1为正常，2表示要删除
		category.setStatus(2);
		//更新修改后的对象信息
		categoryMapper.updateByPrimaryKey(category);
		//开始删除操作
		//1.判断要删除的结点是否为父节点，如果是父节点就级联删除，即删除该父节点下的所有子结点(采用递归法删除)
		if (category.getIsParent()) {
			deleteNode(category.getId());
		}
		//判断当前父节点还有没有子节点，如果有子节点就不用修改了
		//如果父节点没有子节点了，那么就修改父节点的isParent的属性为false,即变为叶子节点
		Category parent = categoryMapper.selectByPrimaryKey(category.getParentId());
		
		List<Category> list = getCategoryListByParentId(parent.getId());
		//判断父节点是否有子节点，就是判断父节点下所有的子节点的状态，为2说明没有子节点了，否则就有子节点
		boolean flag = false;
		for (Category catgory : list) {
			if (catgory.getStatus() == 1) {
				flag = true;
				break;
			}
		}
		
		//如果没有子节点
		if (!flag) {
			parent.setIsParent(false);
			categoryMapper.updateByPrimaryKey(parent);
		}
		
		
		
		return TaotaoResult.ok();
	}
	
	//递归删除所有子节点
	private void deleteNode(Integer parentId) {
		List<Category> list = getCategoryListByParentId(parentId);
		for (Category category : list) {
			category.setStatus(2);
			categoryMapper.updateByPrimaryKey(category);
			if (category.getIsParent()) {
				deleteNode(category.getId());
			}
		}
	}

	//通过父节点的id来查询所有的子节点，这是抽离出来的公共方法
	private List<Category> getCategoryListByParentId(Integer parentId){
		CategoryExample example = new CategoryExample();
		Criteria criteria = example.createCriteria();
		criteria.andParentIdEqualTo(parentId);
		//执行查询
		List<Category> list = categoryMapper.selectByExample(example);
		return list;
	}*/
	
}








