package com.example.demo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.DAO.cartMapper;
import com.example.demo.DTO.cartDTO;

@Service
public class cartService {

	@Autowired
	private cartMapper cartMapper;
	
	public List<cartDTO> myCartList(cartDTO dto) {
		return cartMapper.myCartList(dto);
	}
	
	public void addCart(cartDTO dto) {
		cartMapper.addCart(dto);
	}
	public void cartItemDelete(int cartNo) {
		cartMapper.cartItemDelete(cartNo);
	}
	
	public boolean cartItemCheck(int itemNo, String memberId) {
		int count = cartMapper.cartItemCheck(itemNo, memberId);
		return count > 0;
	}
	
	public cartDTO getCartItem(int cartNo) {
		return cartMapper.getCartItem(cartNo);
	}
	
	public void cartQuantityUpdate(int cartNo,int cartQuantity) {
		cartMapper.cartQuantityUpdate(cartNo, cartQuantity);
	}
	public void cartListDelete(int[] cartNo) {
		cartMapper.cartListDelete(cartNo);
	}
}
