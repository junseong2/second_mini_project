package com.exam.mapper;


import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.exam.dto.FeedbackDTO;
import com.exam.dto.MemberDTO;

@Mapper
public interface FeedbackMapper {
	
	public int writeFeedback(FeedbackDTO dto);
}
