package com.atguigu.mgt.portal.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * 项目启动的时候，将一些常用数据放在application域中，大家都能用
 * @ClassName MyAppListener
 * @Description TODO(这里用一句话描述这个类的作用)
 * @author hao
 * @Date 2017年7月4日 下午7:50:51
 * @version 1.0.0
 */
public class MyAppListener implements ServletContextListener{

    @Override
    public void contextInitialized(ServletContextEvent sce) {
    	
    	System.out.println("starting servlet context ... ... ");
        ServletContext servletContext = sce.getServletContext();        
        //1、将项目路径放在application域中
        servletContext.setAttribute("ctp", servletContext.getContextPath());
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        //2、项目关闭，销毁application域中所有数据

    }

}
