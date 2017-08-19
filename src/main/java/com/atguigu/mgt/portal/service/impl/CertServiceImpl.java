package com.atguigu.mgt.portal.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.mgt.manager.bean.TCert;
import com.atguigu.mgt.manager.dao.TCertMapper;
import com.atguigu.mgt.portal.service.CertService;

@Service
public class CertServiceImpl implements CertService {

	@Autowired
	TCertMapper certMapper;
	
	@Override
	public List<TCert> getCertsByUserId(Integer userId) {
		
		List<TCert> certs = certMapper.getCertsByUserId(userId);
		
		return certs;
	}

}
