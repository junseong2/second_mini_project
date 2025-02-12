package com.exam.service;

import java.util.List;


import com.exam.dto.BoardDTO;
import com.exam.dto.PageDTO;

public interface BoardService {
	public abstract List<BoardDTO> list();
	public int write(BoardDTO dto );
	public BoardDTO retrieve(int num); 
	public int update(BoardDTO dto);
}
