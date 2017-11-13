package com.zhoubianyou.sign.controller;

import org.springframework.context.MessageSource;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhoubianyou.common.BaseController;

@Controller
@RequestMapping("main")
public class SignController extends BaseController {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@RequestMapping("login")
	public String index(){
		addPathToSession();
		return "login";
	}
	@RequestMapping("login1")
	public String index1(){
//		addPathToSession();
		return "main/login";
	}
	
	@RequestMapping("index")
	public String fdfd(){
		return "index";
	}
	
	@RequestMapping("main")
	public String main(){
		
		return "main/main";
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
