package com.exam.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;


import com.exam.dto.BoardDTO;
import com.exam.dto.PageDTO;
import com.exam.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {

	
	BoardMapper mapper;
	public BoardServiceImpl(BoardMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	public List<BoardDTO> list() {
		// TODO Auto-generated method stub
		return mapper.list();
	}

	@Override
	public int write(BoardDTO dto) {
		return mapper.write(dto);
	}

	@Override
	public BoardDTO retrieve(int num) {
		return mapper.retrieve(num);
	}

	@Override
	public int update(BoardDTO dto) {
		// TODO Auto-generated method stub
		return mapper.update(dto);
	}

	@Override
	public int delete(int num) {
		return mapper.delete(num);
	}	

}
