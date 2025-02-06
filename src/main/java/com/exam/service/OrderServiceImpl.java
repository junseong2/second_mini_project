package com.exam.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.exam.dto.CartDTO;
import com.exam.dto.MemberDTO;
import com.exam.dto.OrderDTO;
import com.exam.mapper.OrderMapper;


@Service
public class OrderServiceImpl implements OrderService {

	OrderMapper mapper;
	
	public OrderServiceImpl(OrderMapper mapper) {
		this.mapper = mapper;
	}

	@Override
	public CartDTO orderConfirm(int num) {
		return mapper.orderConfirm(num);
	}

	@Override
	public MemberDTO orderConfirmMember(String userid) {
		return mapper.orderConfirmMember(userid);
	}

	@Override
	public int orderDone(OrderDTO dto) {
		return mapper.orderDone(dto);
	}

	@Override
	public int AfterOrder(int num) {
		return mapper.AfterOrder(num);
	}

	
}
