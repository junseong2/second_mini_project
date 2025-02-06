package com.exam.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.exam.dto.MemberDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class MyHandlerInterceptor implements HandlerInterceptor {
	
	private Logger logger = LoggerFactory.getLogger(getClass());

	// 주요 기능 : 로그인 여부 확인
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("LOGGER : {}, {}","preHandle 호출", handler);
		//handler 는 Controller 임
		
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		if(dto==null) { //로그인 안된 상태
			response.sendRedirect("loginForm");
			return false; //HandlerInterceptor 에서 멈춤
		}
		
		return true; //이후의 Controller로 요청
	}

}
