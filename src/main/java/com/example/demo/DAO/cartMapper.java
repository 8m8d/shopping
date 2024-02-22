package com.example.demo.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.example.demo.DTO.cartDTO;

@Repository
@Mapper
public interface cartMapper {

	public List<cartDTO> myCartList(cartDTO dto);
	public void addCart(cartDTO dto);
	public void cartItemDelete(int cartNo);
	public int cartItemCheck(int itemNo, String memberId);
	public cartDTO getCartItem(int cartNo);
	public void cartQuantityUpdate(int cartNo, int cartQuantity);
	public void cartListDelete(int[] cartNo);
}
