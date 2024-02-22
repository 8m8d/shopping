package com.example.demo.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.example.demo.DTO.boardDTO;
import com.example.demo.DTO.memberDTO;

@Repository
@Mapper
public interface boardMapper {
	
	
	// 게시판 목록
	List<boardDTO>boardList();
	// 게시글 상세
	public boardDTO detailOne(int boardNo);
	// 게시글 추가
	public void insert(boardDTO dto);
	// 게시글 수정
	public void update(boardDTO dto);
	// 게시글 삭제
	public void delete(int boardNo);
	
	public List<boardDTO> myBoardList(boardDTO dto);
}
