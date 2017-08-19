package com.atguigu.mgt.portal.controller;
import java.util.ArrayList;
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

import com.atguigu.mgt.manager.bean.TComentar;
import com.atguigu.mgt.manager.bean.TGames;
import com.atguigu.mgt.manager.bean.TUsers;
import com.atguigu.mgt.portal.service.ComentarService;
import com.atguigu.mgt.portal.service.GameService;
import com.atguigu.mgt.portal.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 处理评论
 * @ClassName ReviewController
 * @Description TODO(这里用一句话描述这个类的作用)
 * @author zhanxp
 * @Date 2017年8月11日 下午4:11:44
 * @version 1.0.0
 */
@RequestMapping("/comentar")
@Controller
public class ReviewController {

    
    @Autowired
    ComentarService comentarService;
    @Autowired
    GameService gameService;
    @Autowired
    UserService userService;
    
    
    
    /**来到用户界面
     * 
     * @Description (TODO这里用一句话描述这个方法的作用)
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/user")
    public String toUser(@RequestParam(value="id")Integer id,Model model){
        // 通过userId查询用户
        TUsers user = userService.selectUser(id);
        model.addAttribute("user",user);
        
        //通过userId查询用户玩过的游戏
        List<TGames> games = gameService.selectGame(id);
        if(games.size() != 0){
            model.addAttribute("games",games);
        }else{
            System.out.println("用户还未玩过游戏");
        }
        
        
        
        //通过userId查询用户最近的评论
        List<TComentar> comentars = comentarService.selectComentar(id);
        
        //通过查出的comentarId查出对应的game
        List<Map<String,Object>> gameComentar = new ArrayList<>();
        for (TComentar tComentar : comentars) {
            Map<String,Object> map = new HashMap<>();
            TComentar comentar = comentarService.getComentar(tComentar.getId());
            TGames game = gameService.getGame(tComentar.getId());
            map.put("comentar", comentar);
            map.put("game", game);
            
            gameComentar.add(map);
        }
      
        model.addAttribute("gameComentar",gameComentar);
        
        
        
        return "user";
    }
    
    
    /**
     * 来到评论详细页面
     * @Description (TODO这里用一句话描述这个方法的作用)
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/reply")
    public String toSingle(@RequestParam(value="id")Integer id,Model model){
           //根据评论id查询
         TGames game = gameService.getGame(id);
         TUsers user = userService.getUser(id);
         TComentar comentar = comentarService.getComentar(id);
           
         model.addAttribute("game",game);
         model.addAttribute("user",user);
         model.addAttribute("comentar",comentar);
        
        return "single";
    }
    
    /**
     * 查出所有的用户评论
     * @Description (TODO这里用一句话描述这个方法的作用)
     * @param model
     * @return
     */
   /* @RequestMapping("/list")
    public String  Card(@RequestParam(value="pn",defaultValue="1")Integer pn,
            @RequestParam(value="ps",defaultValue="6")Integer ps,Model model){
        PageHelper.startPage(pn,ps);
        
        List<Map<String,Object>> comentars =  comentarService.getComentars(); 
        PageInfo<Map<String,Object>> info = new PageInfo<>(comentars,4);
        System.out.println(info);
        model.addAttribute("comentars_info",info);
            
        return "reviews";
    }*/
    
    @ResponseBody
    @RequestMapping("/json")
    public PageInfo<Map<String,Object>> Card(@RequestParam(value="pn",defaultValue="1")Integer pn){
        System.out.println("pn=" + pn );
        PageHelper.startPage(pn,6);
        
        
        List<Map<String,Object>> comentars =  comentarService.getComentars(); 
        PageInfo<Map<String,Object>> info = new PageInfo<Map<String,Object>>(comentars);
        System.out.println(info);
        //model.addAttribute("comentars_info",info);
            
        return info;
    }
    
    @RequestMapping("/list")
    public String list(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model){
       
        PageHelper.startPage(pn,6);
        
        List<Map<String,Object>> comentars =  comentarService.getComentars(); 
        PageInfo<Map<String,Object>> info = new PageInfo<>(comentars,4);
        model.addAttribute("comentars_info",info);
        return "reviews";
    }
    
    
    
    
   
    
    
    
    
    
    
   
    
    
    
    
}
