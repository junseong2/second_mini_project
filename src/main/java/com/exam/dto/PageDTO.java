package com.exam.dto;

import java.util.List;

public class PageDTO {
	
	List<BoardDTO> list;
	int curPage;  //현재 페이지
	int perPage = 5;  //페이지당 보여줄 레코드 개수
	int totalRecord;  //전체 레코드 개수
	
	public List<BoardDTO> getList() {
		return list;
	}
	public void setList(List<BoardDTO> list) {
		this.list = list;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	@Override
	public String toString() {
		return "pageDTO [list=" + list + ", curPage=" + curPage + ", perPage=" + perPage + ", totalRecord="
				+ totalRecord + "]";
	}
	
	
	
}
