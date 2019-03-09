package com.atyou.service;

import com.atyou.pojo.UserInfo;
import com.github.pagehelper.PageInfo;

public interface UserMyService {
	public PageInfo colPage(Integer pn,Integer userId)throws Exception;
	public PageInfo ipPage(Integer pn,Integer userId)throws Exception;
	public Boolean useredit(UserInfo userInfo)throws Exception;
}
