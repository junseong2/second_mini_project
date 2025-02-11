// https://docs.spring.io/spring-security/site/docs/6.2.8/api/org/springframework/security/authentication/AuthenticationProvider.html#authenticate
package com.exam.security;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.exam.dto.MemberDTO;
import com.exam.service.AuthenticationService;

@Component
public class AuthProvider implements AuthenticationProvider {
	
	private Logger logger = LoggerFactory.getLogger(getClass());

	//AuthenticationService 를 주입받아야함
	AuthenticationService service;
	//생성자 주입
	public AuthProvider(AuthenticationService service) {
		this.service = service;
	}
	
	// /////////////////////////////////////////////////////////////

	//사용자가 입력한 userid 와 passwd 를 이용하여 DB 연동하고 체크
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		//여기에서 인증작업
		logger.info("LOGGER : AuthProvider.authenticate 호출");
		
		String userid = (String)authentication.getPrincipal(); //Principal 이 userid
		String passwd = (String)authentication.getCredentials(); //Credentials 이 passwd,1234
		//여기에서 암호화된 비밀번호와 우리가 입력한 비밀번호의 암호화 값을 비교하겠다..?
		
		//DB 와 연동해서 체크, userid 에 해당하는 MemberDTO 얻기
		MemberDTO dto = service.findByUserid(userid);
		
		//passwd 와 MemberDTO 에 있는 encodedPasswd 비교
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		UsernamePasswordAuthenticationToken token=null;
		
		if(dto!=null && (passwordEncoder.matches(passwd, dto.getPasswd()))) {
			//UsernamePasswordAuthenticationToken(Object principal, 
			//									Object credentials, 
			//									Collection<? extends GrantedAuthority> authorities)
			
			MemberDTO new_dto = new MemberDTO();
			new_dto.setUserid(userid);
			new_dto.setPasswd(passwd); //1234
			new_dto.setUsername(dto.getUsername());
			
			List<GrantedAuthority> authorities = new ArrayList<>();
			authorities.add(new SimpleGrantedAuthority("USER")); //현재는 모든 사용자의 role은 USER
			//authorities.add(new SimpleGrantedAuthority("ADMIN")); //필요시 ADMIN 추가 가능
			
			//다음 token 에 저장된 new_dto 와 role 이 세션에 저장됨
			token = new UsernamePasswordAuthenticationToken(new_dto, null, authorities);
			return token;
		}
			throw new BadCredentialsException("비밀번호가 일치하지 않습니다.");

	} //end authenticate

	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}

}
