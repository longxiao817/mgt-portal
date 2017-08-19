package com.atguigu.mgt.portal.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;

@Controller
public class RestApiServerInfo {

    
    @Value("${restapi.server.ip}")
    private String restapiip;

    @Value("${restapi.server.port}")
    private String restapiport;

    @Value("${restapi.server.apppath}")
    private String restapiapppath;

    public String getRestApiURL() {
        String url = "http://" + restapiip + ":" + restapiport + "/" + restapiapppath;
        return url;
    }
}
