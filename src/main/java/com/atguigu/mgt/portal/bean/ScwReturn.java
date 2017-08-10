package com.atguigu.mgt.portal.bean;

import java.util.Map;


public class ScwReturn<T> {

    private int code;
    
    private String msg;
    private T content;
    private Map<String,Object> ext;
    
    public int getCode() {
        return code;
    }
    
    public void setCode(int code) {
        this.code = code;
    }
    
    public String getMsg() {
        return msg;
    }
    
    public void setMsg(String msg) {
        this.msg = msg;
    }
    
    public T getContent() {
        return content;
    }
    
    public void setContent(T content) {
        this.content = content;
    }
    
    public Map<String, Object> getExt() {
        return ext;
    }
    
    public void setExt(Map<String, Object> ext) {
        this.ext = ext;
    }
   
    public static <T> ScwReturn<T> success(String msg,T content,Map<String,Object> ext){
        ScwReturn<T> t = new ScwReturn<>();
        t.setCode(1);
        t.setMsg(msg);
        t.setContent(content);
        t.setExt(ext);
        
        return t;
    }
    
    public static <T> ScwReturn<T> fail(String msg,T content,Map<String,Object> ext){
        ScwReturn<T> t = new ScwReturn<>();
        t.setCode(0);
        t.setMsg(msg);
        t.setContent(content);
        t.setExt(ext);
        
        return t;
    }

}