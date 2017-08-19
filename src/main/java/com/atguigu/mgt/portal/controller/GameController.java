package com.atguigu.mgt.portal.controller;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.mgt.manager.bean.TGames;
import com.atguigu.mgt.portal.bean.MgtReturn;
import com.atguigu.mgt.portal.controller.RestApiServerInfo;
import com.atguigu.project.HttpClientUtil;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageInfo;


@Controller
@RequestMapping("/game")
public class GameController {


    @Autowired
    RestApiServerInfo info;
    
    @RequestMapping("/firstpage.html")
    public String firstpage(HttpSession session){
        
        session.setAttribute("showpage", "firstpage.html");
        return "firstpage";
    }

    @RequestMapping("/rankinglist.html")
    public String rankinglist(HttpSession session){
        session.setAttribute("showpage", "rankinglist.html");
        return "rankinglist";
    }
    //游戏列表
    @ResponseBody
    @RequestMapping("/list")
    public PageInfo<TGames> list(@RequestParam("ty")String ty,HttpSession session,@RequestParam(value="pn",defaultValue="1")Integer pn){
       
        Map<String, Object> map = new HashMap<>();
        map.put("type",ty);
        map.put("pn",pn);
        MgtReturn<PageInfo<TGames>> readValue = new MgtReturn<>();
        System.out.println(info.getRestApiURL() + "/game/list");
        System.out.println("map:"+map);
        try {

            String response = HttpClientUtil.httpPostRequest(info.getRestApiURL() + "/game/list", map);
            readValue = (MgtReturn<PageInfo<TGames>>) new ObjectMapper().readValue(response.getBytes(),
                    new TypeReference<MgtReturn<PageInfo<TGames>>>() {});
        } catch (IOException e) {
            System.out.println("cuole");
            e.printStackTrace();
        }
 
        PageInfo<TGames> pageInfo = readValue.getContent();
     
       System.out.println(pageInfo);
        return pageInfo;
    }
   
    @RequestMapping("/tab")
    public String tab(@RequestParam("tabs")String tabs,@RequestParam(value="pn",defaultValue="1")Integer pn,Model model,HttpSession session){
        Map<String, Object> map = new HashMap<>();
        map.put("tabs", tabs);
        map.put("pn", pn);
        MgtReturn<PageInfo<TGames>> readValue = new MgtReturn<>();
        try {
            String response = HttpClientUtil.httpPostRequest(info.getRestApiURL() + "/game/tabs", map);
           readValue = (MgtReturn<PageInfo<TGames>>) new ObjectMapper().readValue(response.getBytes(), new TypeReference<MgtReturn<PageInfo<TGames>>>() {});
        } catch (Exception e) {
            System.out.println("错了");
            e.printStackTrace();
        }
        PageInfo<TGames> pageInfo = readValue.getContent();
        session.setAttribute("tab_name", tabs);
        model.addAttribute("info", pageInfo);
        System.out.println("tab:"+pageInfo);
        return "tabshow";
    }
    
    @ResponseBody
    @RequestMapping("/tab1")
    public PageInfo<TGames> tab1(@RequestParam("tabs")String tabs,@RequestParam(value="pn",defaultValue="1")Integer pn){
        Map<String, Object> map = new HashMap<>();
        map.put("tabs", tabs);
        map.put("pn", pn);
        MgtReturn<PageInfo<TGames>> readValue = new MgtReturn<>();
        try {
            String response = HttpClientUtil.httpPostRequest(info.getRestApiURL() + "/game/tabs", map);
           readValue = (MgtReturn<PageInfo<TGames>>) new ObjectMapper().readValue(response.getBytes(), new TypeReference<MgtReturn<PageInfo<TGames>>>() {});
        } catch (Exception e) {
            System.out.println("错了");
            e.printStackTrace();
        }
        PageInfo<TGames> pageInfo = readValue.getContent();

        System.out.println("tab:"+pageInfo);
        return pageInfo;
    }
    
    @RequestMapping("/game")
    public String game(@RequestParam("id")Integer id,Model model){
       Map<String, Object> map = new HashMap<>();
      map.put("id", id);
      MgtReturn<TGames> readValue=null;
      try {
        String response = HttpClientUtil.httpPostRequest(info.getRestApiURL() + "/game/game", map);
        readValue =(MgtReturn<TGames>) new ObjectMapper().readValue(response.getBytes(), new TypeReference<MgtReturn<TGames>>() {});
    }  catch (Exception e) {
      e.printStackTrace();
    }
      model.addAttribute("game", readValue.getContent());
      model.addAttribute("flag", 0);
        return "singlegame";
        
    }
    
    @RequestMapping("/game1")
    public String game1(@RequestParam("id")Integer id,Model model){
       Map<String, Object> map = new HashMap<>();
      map.put("id", id);
      MgtReturn<List< Map<String, Object>>> readValue=null;
      try {
        String response = HttpClientUtil.httpPostRequest(info.getRestApiURL() + "/game/game", map);
        readValue =(MgtReturn<List< Map<String, Object>>>) new ObjectMapper().readValue(response.getBytes(), new TypeReference<MgtReturn<List< Map<String, Object>>>>() {});
    }  catch (Exception e) {
      e.printStackTrace();
    }
      model.addAttribute("comentar", readValue.getContent());
      model.addAttribute("flag", 1);
        return "singlegame";
        
    }
}
