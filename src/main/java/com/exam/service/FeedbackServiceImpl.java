package com.exam.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.exam.dto.FeedbackDTO;
import com.exam.dto.GoodsDTO;
import com.exam.mapper.FeedbackMapper;
import com.exam.mapper.GoodsMapper;

//service 부분이니까 @Service 어노테이션 주기
@Service
public class FeedbackServiceImpl implements FeedbackService{

	FeedbackMapper mapper; 
	//생성자로 주입  
	public FeedbackServiceImpl(FeedbackMapper mapper) {
		this.mapper = mapper;  
	}
	@Override
	public int writeFeedback(FeedbackDTO dto) {
		return mapper.writeFeedback(dto);
	}
	@Override
	public List<FeedbackDTO> pullFeedback(String gCode) {
		return mapper.pullFeedback(gCode);
	}   
   

 
}
