package com.exam.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.dto.GoodsDTO;
import com.exam.dto.MemberDTO;
import com.exam.mapper.GoodsMapper;
import com.exam.mapper.MemberMapper;

//service 부분이니까 @Service 어노테이션 주기
@Service
public class MemberServiceImpl implements MemberService{

	MemberMapper mapper;
	//생성자로 주입
	public MemberServiceImpl(MemberMapper mapper) {
		this.mapper = mapper;
	}
	@Override
	public MemberDTO idCheck(String userid) {
		return mapper.idCheck(userid);
	}
	@Override
	public int memberAdd(MemberDTO dto) {
		return mapper.memberAdd(dto);
	}
	@Override
	public MemberDTO login(Map<String, String> map) {
		return mapper.login(map);
	}
	@Override
	public MemberDTO mypage(String userid) {
		return mapper.mypage(userid);
	}
	@Override
	public String findid(MemberDTO dto) {
		return mapper.findid(dto);
	}
	@Override
	public String findpw(MemberDTO dto) {
		return mapper.findpw(dto);
	}
	@Override
	@Transactional
	public int update(MemberDTO dto) {
		return mapper.update(dto);
	}
	@Override
	@Transactional
	public int withdraw(String userid) {
		return mapper.withdraw(userid);
	}
	@Override
	public MemberDTO findByUserid(String userid) {
		return mapper.findByUserid(userid);
	}

}
