package com.exam.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.exam.dto.FeedbackDTO;
import com.exam.dto.GoodsDTO;
import com.exam.dto.MemberDTO;

public interface FeedbackService {

	public int writeFeedback(FeedbackDTO dto);
}
