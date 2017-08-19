package com.atguigu.mgt.portal.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.mgt.manager.bean.TUsers;
import com.atguigu.mgt.manager.bean.TUsersExample;
import com.atguigu.mgt.manager.bean.TUsersExample.Criteria;
import com.atguigu.mgt.manager.dao.TUsersMapper;
import com.atguigu.mgt.portal.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	TUsersMapper usersMapper;
	
	
	/**
	 * 通过用户名获取用户账号信息
	 */
	@Override
	public TUsers getUserByLoginAcct(String loginAcct) {

		TUsersExample example = new TUsersExample();
		Criteria criteria = example.createCriteria();
		criteria.andLoginAcctEqualTo(loginAcct);
		try {
			List<TUsers> list = usersMapper.selectByExample(example);
			if(list != null && list.size() == 1) {
				return list.get(0);
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	
	/**
	 * 实名认证中保存用户基本信息
	 */
	@Override
	public Integer saveInfo(TUsers user) {
		
		int i = usersMapper.updateByPrimaryKeySelective(user);
		return i;
	}

	
	/**
	 * 保存用户实名信息的urls
	 */
	@Override
	public void saveCertUrls(TUsers user) {
		
		
		TUsersExample example = new TUsersExample();
		Criteria criteria = example.createCriteria();
		criteria.andCertUrlsEqualTo(user.getCertUrls());
		usersMapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public List<TUsers> getFansByUserId(Integer userId) {

		return usersMapper.getAllFansByUserId(userId);
	}


	@Override
	public List<TUsers> getAllFocusByUserId(Integer userId) {
		List<TUsers> list = usersMapper.getAllFocusByUserId(userId);
		return list;
	}
}
