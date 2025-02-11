 package com.exam.config;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.resource.PathResourceResolver;

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
      registry.addInterceptor(xxx).addPathPatterns("/logout","/mypage","/cartAdd","/cartList","/cartDelete","/cartDeleteAll","/orderConfirm","/buyGoods");
      
   }
     
   
   @Override
   public void addResourceHandlers(ResourceHandlerRegistry registry) {
      
         registry.addResourceHandler("/images/items/**")       // 논리적인 경로 goodsList.jsp에서 이 경로를 사용하면
              .addResourceLocations("file:///C:/upload/")      // 실제 여기서 가져오게됨(물리적인 경로)
                .setCachePeriod(3600)
                .resourceChain(true)
                .addResolver(new PathResourceResolver());
   }
   
   
}