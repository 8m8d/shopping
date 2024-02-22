package com.example.demo.DTO;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class boardDTO {
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String boardWriter;
	private Timestamp boardRegDate;
}
