package com.atguigu.mgt.portal.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.mgt.manager.bean.TUserFocusExample;
import com.atguigu.mgt.manager.bean.TUserFocusExample.Criteria;
import com.atguigu.mgt.manager.dao.TUserFocusMapper;
import com.atguigu.mgt.portal.service.UserFocusService;

@Service
public class UserFocusServiceImpl implements UserFocusService{

	@Autowired
	TUserFocusMapper userFocusMapper;

	@Override
	public Long getAllFocusByUserId(Integer userId) {
		
		TUserFocusExample example = new TUserFocusExample();
		Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(userId);
		long l = 0;
		try {
			l = userFocusMapper.countByExample(example );
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return l;
	}
	
	
	
}
