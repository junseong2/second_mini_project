package com.exam.service;

import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.dto.MemberDTO;
import com.exam.mapper.MemberMapper;

@Service
public class AuthenticationServiceImpl implements AuthenticationService {

	MemberMapper mapper;
	//생성자로 주입
	public AuthenticationServiceImpl(MemberMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	public MemberDTO findByUserid(String userid) {
		//userid 로 가져온 MemberDTO 에서 DTO 내 암호화된 passwd 를 알 수 있음
		return mapper.findByUserid(userid);
	}


//	@Override
//	public MemberDTO authenticate(Map<String, String> map) {
//		//map에 저장된 passwd 인 1234 를 암호화해서 DB 와 비교해야 함
		//이 파일에서 new BcryptPasswordEncoder() 객체생성하기 부담스러움
//		return null;
//	}

}
