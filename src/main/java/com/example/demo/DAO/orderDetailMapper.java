package com.example.demo.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.example.demo.DTO.orderDetailDTO;

@Repository
@Mapper
public interface orderDetailMapper {

	public void insertOrder(orderDetailDTO orderDetails);
	public int orderCount(int orderNo);
	public List<orderDetailDTO> orderDetailList(int orderNo);
}
