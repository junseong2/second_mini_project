package com.exam.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.exam.dto.GoodsDTO;

public interface GoodsService {

	public List<GoodsDTO> goodsList(String gCategory);
	public GoodsDTO goodsRetrieve(String gCode);
	public List<GoodsDTO> search(String gName);
}
