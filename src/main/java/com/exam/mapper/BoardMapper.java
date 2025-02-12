package com.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.exam.dto.BoardDTO;
import com.exam.dto.CartDTO;
import com.exam.dto.MemberDTO;
import com.exam.dto.OrderDTO;
import com.exam.dto.PageDTO;

@Mapper
public interface BoardMapper {

	public abstract List<BoardDTO> list();
	public int write(BoardDTO dto );
	public BoardDTO retrieve(int num); 
	public int update(BoardDTO dto);
	public int delete(int num);
}
