package com.atguigu.mgt.portal.controller.xktcontroller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

@Controller
public class RestApiServerInfo {
    
 // MemberService memberService;
    @Value("127.0.0.1")
    private String restapiserver;

    @Value("8082")
    private String restapiport;

    @Value("mgt-restapi")
    private String appPath;

    public String getRestApiURL() {
        System.out.println("http://" + restapiserver + ":" + restapiport);
        return "http://" + restapiserver + ":" + restapiport + "/" + appPath;
    }

}
