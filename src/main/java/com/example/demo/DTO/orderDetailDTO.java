package com.example.demo.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class orderDetailDTO {

	private int orderDetailNo;
	private int orderNo;
	private int itemNo;
	private int orderDetailQuantity;
	private int orderDetailAmount;
}
