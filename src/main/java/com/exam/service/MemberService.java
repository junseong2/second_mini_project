package com.exam.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.exam.dto.GoodsDTO;
import com.exam.dto.MemberDTO;

public interface MemberService {

	public MemberDTO idCheck(String userid);
	public int memberAdd(MemberDTO dto);
	public MemberDTO login(Map<String, String> map);
	public MemberDTO mypage(String userid);
	
	public String findid(MemberDTO dto);
	public String findpw(MemberDTO dto);
	
	public int update(MemberDTO dto);
	public int withdraw(String userid);
	
	public MemberDTO findByUserid(String userid);
}
