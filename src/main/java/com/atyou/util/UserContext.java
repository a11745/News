package com.atyou.util;

import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.atyou.pojo.UserInfo;
import com.atyou.vo.VerifyCodeVO;

/**
 * 存取当前登录用户的工具类
 * 
 * @author Administrator
 * 
 */
public class UserContext {

	
	public static final String VERIFY_IN_SESSION="verify_in-session"; 
	public static final String REGISTER_IN_SESSION = "registerinfo";

	private static HttpSession getSession() {
		return ((ServletRequestAttributes) RequestContextHolder
				.getRequestAttributes()).getRequest().getSession();
	}
	
	public static void putCurrent(UserInfo current) {
		getSession().setAttribute(REGISTER_IN_SESSION, current);
	}

	public static UserInfo getCurrent() {
		return (UserInfo) getSession().getAttribute(
				REGISTER_IN_SESSION);
	}
	
	/**
	 * 
	 * @param vc
	 */
	public static void putVerifyCode(VerifyCodeVO vc) {
		getSession().setAttribute(VERIFY_IN_SESSION, vc);
	}

	/**
	 * 得到当前短信验证码
	 * @return
	 */
	public static VerifyCodeVO getCurrentVerifyCode() {
		return (VerifyCodeVO) getSession().getAttribute(VERIFY_IN_SESSION);
	}

}
