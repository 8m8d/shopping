package com.example.demo.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.example.demo.DTO.orderDTO;

@Repository
@Mapper
public interface orderMapper {
	
	// 전체 주문 조회
	public List<orderDTO> orderSelectAll(String memberId);
	
	// 주문 추가
	int addOrder(orderDTO dto);
	
	 // 주문 취소
	public void orderListDelete(int orderNo); 
}
