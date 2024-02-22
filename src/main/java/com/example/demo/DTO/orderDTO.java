package com.example.demo.DTO;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class orderDTO {

	private	int orderNo;
	private String recipientName;
	private String recipientPhone;
	private String deliveryPostcode;
	private String deliveryAddress;
	private String deliveryDetailAddress;
	private String deliveryExtraAddress;
	private String orderDate;
	private String orderStatus;
	private	int orderPoint;
	private	int deliveryCharge;
	private	int orderTotalPrice;
	private String memberId;
	
	private String imgFilePath;
	private String itemTitle;
	
	private List<orderDetailDTO> orderDetail;
}
