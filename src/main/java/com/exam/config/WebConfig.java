package com.exam.config;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.exam.interceptor.MyHandlerInterceptor;


//MyFilter 등록
@Configuration
public class WebConfig implements WebMvcConfigurer {

	@Autowired
	MyHandlerInterceptor xxx;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		//registry.addInterceptor(xxx);
		// /cart* 로 퉁쳐도됨
		registry.addInterceptor(xxx).addPathPatterns("/logout","/mypage","/cartAdd","/cartList","/cartDelete","/cartDeleteAll","/orderConfirm");
		
	}
	
}
