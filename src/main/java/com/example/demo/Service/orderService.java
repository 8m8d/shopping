package com.example.demo.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
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
	    Date date = new Date();
	    SimpleDateFormat format = new SimpleDateFormat("yyHHmmss");
	    int orderNo = Integer.parseInt(format.format(date));
	    dto.setOrderNo(orderNo);
	    orderMapper.addOrder(dto);
	    return dto.getOrderNo();
	}
	
	public void orderListDelete(int orderNo) {
		orderMapper.orderListDelete(orderNo);
	}
	
	public orderDTO selectOne(int orderNo) {
		return orderMapper.selectOne(orderNo);
	}
}
