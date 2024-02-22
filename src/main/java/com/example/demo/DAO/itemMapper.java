package com.example.demo.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.example.demo.DTO.itemDTO;

@Mapper
@Repository
public interface itemMapper {

	public List<itemDTO>selectAll();
	public itemDTO detailOne(int itemNo);
	public void addItem(itemDTO dto);
	public void itemUpdate(itemDTO dto);
	public List<itemDTO>searchItem(String itemTitle);
}
