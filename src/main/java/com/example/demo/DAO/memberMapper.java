package com.example.demo.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.example.demo.DTO.memberDTO;

@Repository
@Mapper
public interface memberMapper {
	// 게시글 전체
	List<memberDTO> memberAll();
	// 로그인 하기
	public memberDTO signInOk(memberDTO dto);
	// 회원가입 하기
	public void signUpOk(memberDTO dto);
	// ID 중복확인
	public int idCheck(String MemberId);
	// 내정보
	public void myPageUpdate(memberDTO dto);
	
	public memberDTO memberInfo(String memberId);
	
	public void memberPointUpdate(memberDTO dto);
}
