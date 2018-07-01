package com.shuyue.book.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		String url= request.getRequestURI();
		String[] allowUrls =new String[]{"/loginpage","/login","/registerpage","/register","/index","/VerifyCode"};
		for (String strUrl : allowUrls) {  
            if(url.contains(strUrl))  
            {  
                return true;  
            }  
        }  
		HttpSession session=request.getSession();
		String username=(String) session.getAttribute("userName");
		if(username!="" && username!=null) {
			return true;
		}
		response.sendRedirect("http://localhost:8080/shuyue/loginpage");
		return false;
		
	}

}
