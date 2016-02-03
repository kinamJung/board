package com.hanains.board.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hanains.board.service.UserService;
import com.hanains.board.vo.UserVo;

public class AuthLoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		UserVo vo = new UserVo();
		vo.setUserID(id);
		vo.setPassword(password);
		
		ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
		UserService userService = applicationContext.getBean(UserService.class);
		
		UserVo authUser = userService.login(vo);
		System.out.println("authUser:"+authUser);
		if(authUser == null){
			//redirect fail page
			response.sendRedirect(request.getContextPath() + "/user/retry");
			return false;
		}
		
		//login session
		HttpSession session = request.getSession(true);
		session.setAttribute("authUser", authUser);
		response.sendRedirect( request.getContextPath() + "/" );
		
		
		return false;
	}
	
}
