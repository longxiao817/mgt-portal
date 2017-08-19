package com.atguigu.mgt.portal.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.mgt.manager.bean.TUserFansExample;
import com.atguigu.mgt.manager.bean.TUserFansExample.Criteria;
import com.atguigu.mgt.manager.dao.TUserFansMapper;
import com.atguigu.mgt.portal.service.UserFansService;


@Service
public class UserFansServiceImpl implements UserFansService{

	@Autowired
	TUserFansMapper userFansMapper;

	@Override
	public Long getAllFansByUserId(Integer userId) {
		
		TUserFansExample example = new TUserFansExample();
		Criteria criteria = example.createCriteria();
		criteria.andUseridEqualTo(userId);
		long l = userFansMapper.countByExample(example);
		
		return l;
	}
	
	
	
	
}
