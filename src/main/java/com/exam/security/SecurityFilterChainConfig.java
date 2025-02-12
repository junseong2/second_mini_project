package com.exam.security;

import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityFilterChainConfig {
	
	 @Bean
     public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
  
		 //1-1. csrf 비활성화
		 http.csrf((csrf) -> csrf.disable());
		 
		 //1-2. 요청 맵핑값 허용
		 //home 과 signup 요청을 하면 인증하지 않아도 허용해주겠다는 뜻
		 http.authorizeHttpRequests((auth)->
		 							auth.requestMatchers("/main","/signup","/idCheck","/login","/goodsRetrieve","/WEB-INF/**", "/manager","/search","/goodsRegister","/findid","/updatepw","/goodsList","/list","/retrieve").permitAll()
		 							//	.requestMatchers("/**").permitAll()
		 								//home과 signup을 제외한 나머지 요청은
		 								.anyRequest()
		 								.authenticated() //인증해라
				 					);
         
		 //2,3. 사용자가 만든 로그인 정보 설정, 로그인 성공/실패시
		 //requestMatchers에서 permitAll()을 지정한 요청맵핑값을 제외한 모든 요청은 /login 으로 리다이렉트됨
		 http.formLogin((formLogin)->
				 		formLogin.loginPage("/login") //LoginController 의 @GetMapping(value={"/login"}) 값
						 		 .loginProcessingUrl("/auth") //loginForm.jsp 의 form의 action 값
						 		 //<input type="text" name="userid" 의 userid
				 				 .usernameParameter("userid") //loginForm.jsp 의 userid
				 				//<input type="text" name="passwd" 의 passwd
				 				 .passwordParameter("passwd") //loginForm.jsp 의 passwd
				 				 .failureUrl("/login") //로그인 실패 시 redirect 되는 요청맵핑값
				 				 .defaultSuccessUrl("/main", true) //로그인 성공 시 redirect 되는 요청맵핑값
				 		);
		 
		 //4. 로그아웃 설정
		 http.logout((logout) ->
			         logout.deleteCookies("remove")
				           .invalidateHttpSession(true)
				           .logoutUrl("/logout") //Spring Security 가 자동으로 로그아웃 처리해줄 요청맵핑값
				           .logoutSuccessUrl("/main") //logout을 성공한 경우 redirect 되는 요청맵핑값
				 	);
		 
		 return http.build();
     }
	 
	// 정적 리소스 spring security 대상에서 제외
	 @Bean
	 public WebSecurityCustomizer webSecurityCustomizer() {
	   return (web) ->
	                   web
	                       .ignoring()
	                       .requestMatchers(
	                         PathRequest.toStaticResources().atCommonLocations()
	                       );
	 }

}
