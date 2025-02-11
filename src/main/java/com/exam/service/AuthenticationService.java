package com.exam.service;

import java.util.Map;

import com.exam.dto.MemberDTO;

public interface AuthenticationService {
	
	//public MemberDTO authenticate(Map<String, String> map);
	//userid 를 MemberDTO로 가져오고 그 DTO 에서 암호화된 비번도 가져옴
	public MemberDTO findByUserid(String userid);

}
