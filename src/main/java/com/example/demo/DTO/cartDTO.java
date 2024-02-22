package com.example.demo.DTO;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class cartDTO {
	
	private int cartNo;
	private int cartQuantity;
	private String memberId;
	private int itemNo;
	private String itemTitle;
	private	int itemPrice;
	private int itemDiscount;
	private	String imgFileName;
	private	String imgFilePath;
	private int cartTotalPrice;
	
    public void calculateCartTotalPrice(itemDTO item) {
    	int discountedPrice = item.getItemPrice() - (item.getItemPrice() * item.getItemDiscount() / 100);
        this.cartTotalPrice = cartQuantity * discountedPrice;
    }
}
