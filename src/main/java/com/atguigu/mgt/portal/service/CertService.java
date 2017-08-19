package com.atguigu.mgt.portal.service;

import java.util.List;

import com.atguigu.mgt.manager.bean.TCert;

public interface CertService {

	List<TCert> getCertsByUserId(Integer userId);
	
}
