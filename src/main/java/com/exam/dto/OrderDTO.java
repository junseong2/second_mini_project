package com.exam.dto;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
 
  create table cart
  ( num int AI PK 
userid varchar(10) 
gCode varchar(20) 
gSize char(1) 
gColor varchar(10) 
gAmount int 
orderName varchar(10) 
post varchar(5) 
addr1 varchar(500) 
addr2 varchar(500) 
phone varchar(11) 
orderDay date
  );   
 
 */
//@AllArgsConstructor
//@NoArgsConstructor
//@Setter
//@Getter
//@ToString
@Alias("OrderDTO")
public class OrderDTO {

	String userid;
	String gCode;
	String gSize;
	String gColor;
	int gAmount;
	String orderName;
	String post;
	String addr1;
	String addr2;
	String phone;
	String orderDay;
	
	
	public OrderDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public OrderDTO(String userid, String gCode, String gSize, String gColor, int gAmount, String orderName,
			String post, String addr1, String addr2, String phone, String orderDay) {
		super();
		this.userid = userid;
		this.gCode = gCode;
		this.gSize = gSize;
		this.gColor = gColor;
		this.gAmount = gAmount;
		this.orderName = orderName;
		this.post = post;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.phone = phone;
		this.orderDay = orderDay;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getgCode() {
		return gCode;
	}


	public void setgCode(String gCode) {
		this.gCode = gCode;
	}


	public String getgSize() {
		return gSize;
	}


	public void setgSize(String gSize) {
		this.gSize = gSize;
	}


	public String getgColor() {
		return gColor;
	}


	public void setgColor(String gColor) {
		this.gColor = gColor;
	}


	public int getgAmount() {
		return gAmount;
	}


	public void setgAmount(int gAmount) {
		this.gAmount = gAmount;
	}


	public String getOrderName() {
		return orderName;
	}


	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}


	public String getPost() {
		return post;
	}


	public void setPost(String post) {
		this.post = post;
	}


	public String getAddr1() {
		return addr1;
	}


	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}


	public String getAddr2() {
		return addr2;
	}


	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getOrderDay() {
		return orderDay;
	}


	public void setOrderDay(String orderDay) {
		this.orderDay = orderDay;
	}


	@Override
	public String toString() {
		return "OrderDTO [userid=" + userid + ", gCode=" + gCode + ", gSize=" + gSize + ", gColor=" + gColor
				+ ", gAmount=" + gAmount + ", orderName=" + orderName + ", post=" + post + ", addr1=" + addr1
				+ ", addr2=" + addr2 + ", phone=" + phone + ", orderDay=" + orderDay + "]";
	}

	
	
}




