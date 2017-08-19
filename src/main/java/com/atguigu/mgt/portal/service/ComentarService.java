package com.atguigu.mgt.portal.service;

import java.util.List;
import java.util.Map;

import com.atguigu.mgt.manager.bean.TComentar;


public interface ComentarService {

    public List<Map<String, Object>> getComentars();

    public TComentar getComentar(Integer id);

    public List<TComentar> selectComentar(Integer id);

}
