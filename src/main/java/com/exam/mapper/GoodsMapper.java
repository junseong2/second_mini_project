package com.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.exam.dto.GoodsDTO;

@Mapper
public interface GoodsMapper {

	public List<GoodsDTO> goodsList(String gCategory);

	public GoodsDTO goodsRetrieve(String gCode);

	public int goodsAdd(GoodsDTO dto);

	public List<GoodsDTO> search(String gName);

	public List<GoodsDTO> getAllGoodsByCategory(String gCategory);




}
