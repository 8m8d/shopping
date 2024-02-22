package com.example.demo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.DAO.orderDetailMapper;
import com.example.demo.DTO.orderDetailDTO;

@Service
public class orderDetailService {

	@Autowired
	private orderDetailMapper orderDetailMapper;
	
	public void insertOrder(List<orderDetailDTO> orderDetails) {
		for(orderDetailDTO orderDetail : orderDetails) {
			orderDetailMapper.insertOrder(orderDetail);
		}
	}
	
	public int orderCount(int orderNo) {
		return orderDetailMapper.orderCount(orderNo);
	}
	public List<orderDetailDTO> orderDetailList(int orderNo) {
		return orderDetailMapper.orderDetailList(orderNo);
	}
}
