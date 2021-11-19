package com.ezen.myapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{


	
	@Override
	public void postHandle(
			HttpServletRequest request,
			HttpServletResponse response, 
			Object handler,
			ModelAndView modelAndView
			) throws Exception {
		
	Object memberid = modelAndView.getModel().get("memberid");
	
		if (memberid != null) {
			
			HttpSession session = request.getSession();
			session.setAttribute("memberid", memberid);
		}		
	}
	
	public boolean preHandle(
			HttpServletRequest request,
			HttpServletResponse response, 
			Object handler) {
		
		//硫붿냼�뱶 �룞�옉�쟾�뿉 �꽭�뀡媛믪씠 �엳�쑝硫� �젣嫄�
		
		HttpSession session = request.getSession();
		if (session.getAttribute("memberid")  != null) {
			session.removeAttribute("memberid");
			session.invalidate();
		}
		return true;
	}
	
	
	
}
