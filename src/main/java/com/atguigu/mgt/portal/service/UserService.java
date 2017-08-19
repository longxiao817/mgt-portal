package com.atguigu.mgt.portal.service;

import java.util.List;

import com.atguigu.mgt.manager.bean.TUsers;

public interface UserService {

	TUsers getUserByLoginAcct(String loginAcct);

	Integer saveInfo(TUsers user);

	void saveCertUrls(TUsers user);

	List<TUsers> getFansByUserId(Integer userId);

	List<TUsers> getAllFocusByUserId(Integer userId);

}
