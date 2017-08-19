package com.atguigu.mgt.portal.service;


import com.atguigu.mgt.manager.bean.TUsers;


public interface UserService {



    TUsers getUser(Integer id);

    TUsers selectUser(Integer id);


    
}
