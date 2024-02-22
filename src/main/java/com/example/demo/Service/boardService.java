package com.example.demo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.DAO.boardMapper;
import com.example.demo.DTO.boardDTO;
import com.example.demo.DTO.memberDTO;

@Service
public class boardService {
	
	@Autowired
	boardMapper boardMapper;
	// 게시글 상세
	public boardDTO detailOne(int no) {
		return boardMapper.detailOne(no);
	}
	// 게시글 추가
	public void insert(boardDTO dto) {
		boardMapper.insert(dto);
	}
	// 게시글 수정
	public void update(boardDTO dto) {
		boardMapper.update(dto);
	}
	// 게시글 전체
	public List<boardDTO>boardList(){
		return boardMapper.boardList();
	}
	// 게시글 삭제
	public void delete(int no) {
		boardMapper.delete(no);
	}
	
	public List<boardDTO> myBoardList(boardDTO dto) {
		return boardMapper.myBoardList(dto); 
	}
}
