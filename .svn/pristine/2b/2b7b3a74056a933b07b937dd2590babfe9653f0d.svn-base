package com.atyou.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atyou.dao.UserInfoMapper;
import com.atyou.dao.UserlogMapper;
import com.atyou.pojo.UserInfo;
import com.atyou.pojo.UserInfoExample;
import com.atyou.pojo.UserInfoExample.Criteria;
import com.atyou.pojo.Userlog;
import com.atyou.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	private UserInfoMapper userInfoMapper;
	@Autowired
	private UserlogMapper userlogMapper;
	
	@Override
	public Boolean login(String phone,String password,String ip) throws Exception {
		UserInfoExample example = new UserInfoExample();
		Criteria criteria = example.createCriteria();
		criteria.andPhoneEqualTo(phone);
		criteria.andPasswordEqualTo(password);
		List<UserInfo> list = userInfoMapper.selectByExample(example);
		if (list!=null && list.size()>0) {
			Userlog userlog = new Userlog();
			userlog.setAddtime(new Date());
			userlog.setIp(ip);
			userlog.setUserId(list.get(0).getId());
			userlogMapper.insert(userlog);
			return true;
		}
		return false;
		
	}

	@Override
	public UserInfo selectUser(String phone) throws Exception {
		UserInfoExample example = new UserInfoExample();
		Criteria criteria = example.createCriteria();
		criteria.andPhoneEqualTo(phone);
		List<UserInfo> list = userInfoMapper.selectByExample(example);
		if (list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}
	
	
}
