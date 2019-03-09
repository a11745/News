package com.atyou.service;

import java.util.List;

import com.atyou.common.EasyUITreeNode;

public interface AdminService {
	List<EasyUITreeNode> getItemCatList(Integer parentId) throws Exception;
	List<EasyUITreeNode> getItemCatList2(Integer parentId) throws Exception;
}
