package com.example.demo.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import com.example.demo.DAO.memberMapper;
import com.example.demo.DTO.memberDTO;

@Service
public class memberService {
	@Autowired
	private memberMapper memberMapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	// 전체 회원정보
	public List<memberDTO>memberAll(){
		return memberMapper.memberAll();
	}
	// 로그인 하기
	public memberDTO signInOk(memberDTO dto) {
		return memberMapper.signInOk(dto);
	}
	
	// 암호화 메서드
	public String encodePassword(String plainPassword) {
		return passwordEncoder.encode(plainPassword);
	}
	
	// 회원가입 하기
	public void signUpOk(memberDTO dto) {
		// 패스워드 Encdoer 시키기
		dto.setMemberPassword(encodePassword(dto.getMemberPassword()));
		dto.setMemberPasswordCheck(encodePassword(dto.getMemberPasswordCheck()));
		memberMapper.signUpOk(dto);
	}
	// 아이디 중복확인
	public boolean idCheck(String MemberId) {
		int count = memberMapper.idCheck(MemberId);
		return count > 0;
	}
	// 마이페이지 수정(패스워드 암호화)
	public void myPageUpdate(memberDTO dto) {
		dto.setMemberPassword(encodePassword(dto.getMemberPassword()));
		dto.setMemberPasswordCheck(encodePassword(dto.getMemberPasswordCheck()));
		memberMapper.myPageUpdate(dto);
	}
	// 멤버 정보 찾기
	public memberDTO memberInfo(String memberId) {
		return memberMapper.memberInfo(memberId);
	}
	
	public Map<String, String> validateHandling(Errors errors) {
        Map<String, String> validatorResult = new HashMap<>();
        for(FieldError error : errors.getFieldErrors()){
            String validKeyName = String.format("valid_%s", error.getField());
            validatorResult.put(validKeyName, error.getDefaultMessage());
        }
        return validatorResult;
    }
	
	public boolean validationSignin(String memberId, String memberPassword) {
		memberDTO dto = memberMapper.memberInfo(memberId);
		if(dto == null) {
			System.out.println(dto+"해당 이메일의 유저가 존재하지 않습니다.");
			return false;
		}
		if(!passwordEncoder.matches(memberPassword, dto.getMemberPassword())) {
			System.out.println(dto+"비밀번호가 일치하지 않습니다.");
			return false;
		}
		return true;
		
	}
	
	public void memberPointUpdate(memberDTO dto) {
		memberMapper.memberPointUpdate(dto);
	}
}
