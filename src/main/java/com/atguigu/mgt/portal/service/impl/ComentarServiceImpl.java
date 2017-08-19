package com.atguigu.mgt.portal.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.mgt.manager.bean.TComentar;
import com.atguigu.mgt.manager.bean.TGames;
import com.atguigu.mgt.manager.bean.TUsers;
import com.atguigu.mgt.manager.dao.TComentarMapper;
import com.atguigu.mgt.manager.dao.TGamesMapper;
import com.atguigu.mgt.manager.dao.TUsersMapper;
import com.atguigu.mgt.portal.service.ComentarService;

@Service
public class ComentarServiceImpl implements ComentarService{

    @Autowired
    TComentarMapper comentarMapper;
    @Autowired
    TGamesMapper gamesMapper;
    @Autowired
    TUsersMapper usersMapper;
    
    /**
     * 
     */
    @Override
    public List<Map<String,Object>> getComentars() {
        //获取所有评论
        List<TComentar> comentars = comentarMapper.selectByExample(null);
        
        //通过评论id,查询
        List<Map<String,Object>> card = new ArrayList<Map<String,Object>>();
        for (TComentar comentar : comentars) {
            Map<String, Object> map = new HashMap<>();
            TGames game = gamesMapper.getGameByComentarId(comentar.getId());
            TUsers user = usersMapper.getUserByComentarId(comentar.getId());
            map.put("comentar", comentar);
            map.put("game", game);
            map.put("user", user);
            
            card.add(map);
        }
        return card;
        
    }


    
    @Override
    public TComentar getComentar(Integer id) {
        return comentarMapper.selectByPrimaryKey(id);
    }


    /**
     * 通过用户id，查出用户的评论
     */
    @Override
    public List<TComentar> selectComentar(Integer id) {
        return comentarMapper.selectComentarByUserId(id);
    }

}
