package com.example.demo.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class itemDTO {

	private int itemNo;
	private String itemTitle;
	private int itemPrice;
	private int itemDiscount;
	private String itemImg_path;
	private String imgFileName;
	private String imgFilePath;
}
