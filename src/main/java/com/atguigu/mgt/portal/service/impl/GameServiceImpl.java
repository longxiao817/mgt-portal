package com.atguigu.mgt.portal.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.mgt.manager.bean.TGames;
import com.atguigu.mgt.manager.dao.TGamesMapper;
import com.atguigu.mgt.portal.service.GameService;

@Service
public class GameServiceImpl implements GameService{

	@Autowired
	TGamesMapper gamesMapper;
	
	
	@Override
	public List<TGames> getAllGamesByUserId(Integer userId) {
		
		return gamesMapper.getAllGamesByUserId(userId);
		
	}

}
