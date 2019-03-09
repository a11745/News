package com.atyou.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
/**
 * 专门用于登录检查的拦截器
 * @author Administrator
 *
 */
public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//判断登录逻辑
		//1.
		if (handler instanceof HandlerMethod) {
			HandlerMethod hm = (HandlerMethod) handler;
			RequireLogin rl = hm.getMethodAnnotation(RequireLogin.class);
			if (rl!=null && request.getSession().getAttribute("user")==null) {
				response.sendRedirect("/login");
				return false;
			}
		}
		return super.preHandle(request, response, handler);
	}
}	
