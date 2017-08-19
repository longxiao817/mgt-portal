package com.atguigu.mgt.portal.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.mgt.manager.bean.TComentar;
import com.atguigu.mgt.manager.bean.TUsers;
import com.atguigu.mgt.manager.dao.TUsersMapper;
import com.atguigu.mgt.portal.service.UserService;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    TUsersMapper usersMapper;

   

    @Override
    public TUsers getUser(Integer id) {
        
        return usersMapper.getUserByComentarId(id);
    }



    @Override
    public TUsers selectUser(Integer id) {
        
        return usersMapper.selectByPrimaryKey(id);
    }



  
    
}
