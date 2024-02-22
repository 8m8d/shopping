package com.example.demo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.DAO.orderMapper;
import com.example.demo.DTO.orderDTO;

@Service
public class orderService {

	@Autowired
	private orderMapper orderMapper;
	
	public List<orderDTO> orderSelectAll(String memberId){
		return orderMapper.orderSelectAll(memberId);
	}
	
	public int addOrder(orderDTO dto) {
	    orderMapper.addOrder(dto);
	    return dto.getOrderNo();
	}
	
	public void orderListDelete(int orderNo) {
		orderMapper.orderListDelete(orderNo);
	}
}
