package com.atguigu.mgt.portal.controller.xktcontroller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.atguigu.mgt.manager.bean.TGames;
import com.atguigu.mgt.portal.bean.MgtReturn;
import com.atguigu.project.HttpClientUtil;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/upload")
public class UploadController {
   @Autowired
   private RestApiServerInfo info;
   
   @RequestMapping("/toUpload")
   public String toUpload(){
       return "gameUpload";
   }
   
   @RequestMapping(value="/game")
   public String toGame(TGames tGames) throws Exception{
       Map<String, Object> map=new HashMap<String, Object>();
       
       System.out.println(tGames);
       map.put("name", tGames.getName());
//       map.put("introduce", tGames.getIntroduce());
//       map.put("gameupdate", tGames.getGameupdate());
//       map.put("size", tGames.getSize());
//       map.put("version", tGames.getVersion());
//       map.put("tab", tGames.getTab());
//         map.put("icon", icon);
//       map.put("gamefile", gamefile);
//       map.put("gameimg", gameimg);
       
       
       
//       JSONObject jsonParam = new JSONObject();  
//       jsonParam.put("name", tGames.getName());
//       StringEntity entity = new StringEntity(jsonParam.toString(),"utf-8");//解决中文乱码问题    
//       entity.setContentEncoding("UTF-8");    
//       entity.setContentType("application/json");
       
//       String string = null; 
//       string = HttpClientUtil.httpPostJsonRequest(info.getRestApiURL()+"/upload/game", entity);
       
//       Map<String, Object> map = new HashMap<String, Object>();
       
       String string = HttpClientUtil.httpPostRequest(info.getRestApiURL() + "/upload/game", map);
       
       MgtReturn<Object> readValue = new ObjectMapper().readValue(string.getBytes(),
               new TypeReference<MgtReturn<Object>>(){});      
           return "success";
       
   }
}
