package com.zhoubianyou.common;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class BaseController implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void addPathToSession() {
		RequestAttributes ra = RequestContextHolder.getRequestAttributes();
		HttpServletRequest request = ((ServletRequestAttributes) ra).getRequest();
		String path = request.getContextPath();// 发布时的项目名
//		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
//				+ "/";
		request.getSession().setAttribute("basePath", path);
//		request.getSession().setAttribute("yunPath", PropertiesUtils.getProp("BINDING_OSS_DOMAIN"));
		//饰品分类
//		List<ProductTypeTable> productTypes = ProductTypeTitleUtil.getAllProductType();
//		request.getSession().setAttribute("productTypes",productTypes);
//		if ("zh_CN".equals(PropertiesUtils.getProp("serverLocale"))) {
//			request.getSession().setAttribute("isCn", 1);
//		} else {
//			request.getSession().setAttribute("isCn", 0);
//		}
//		request.getSession().setAttribute(name, employee);
	}

}
