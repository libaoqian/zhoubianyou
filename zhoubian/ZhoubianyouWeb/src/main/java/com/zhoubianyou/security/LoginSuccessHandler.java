package com.zhoubianyou.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

public class LoginSuccessHandler extends
		SavedRequestAwareAuthenticationSuccessHandler {

	public void onAuthenticationSuccess(HttpServletRequest request,
			HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {

		UserDetails userDetails = (UserDetails) authentication.getPrincipal();

		// 输出登录提示信息
		System.out.println("管理员 " + userDetails.getUsername() + " 登录");

		super.onAuthenticationSuccess(request, response, authentication);
	}

}
