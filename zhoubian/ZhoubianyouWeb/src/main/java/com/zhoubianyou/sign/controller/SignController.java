package com.zhoubianyou.sign.controller;

import org.springframework.context.MessageSource;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("main")
public class SignController {
	
	@RequestMapping("login")
	public String index(){
		return "main/login";
	}
	
	@RequestMapping("index")
	public String fdfd(){
		return "index";
	}
	@RequestMapping("toLogin")
	public String toLogin(){
		System.out.println("登录陈宫");
		
		return "main/index";
	}
	@RequestMapping("error")
	public String error(){
		System.out.println("登录事变");
		
		return "index";
	}

}
