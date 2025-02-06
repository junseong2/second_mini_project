package com.exam.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.exam.dto.GoodsDTO;
import com.exam.mapper.GoodsMapper;

//service 부분이니까 @Service 어노테이션 주기
@Service
public class GoodsServiceImpl implements GoodsService{

	GoodsMapper mapper;
	//생성자로 주입
	public GoodsServiceImpl(GoodsMapper mapper) {
		this.mapper = mapper;
	}

	@Override
	public List<GoodsDTO> goodsList(String gCategory) {
		return mapper.goodsList(gCategory);
	}

}
