package com.atguigu.mgt.portal.service;


import java.util.List;

import com.atguigu.mgt.manager.bean.TGames;


public interface GameService {


    public TGames getGame(Integer id);

    public List<TGames> selectGame(Integer id);

	public List<TGames> getAllGamesByUserId(Integer userId);

}
