package com.example.demo.DTO;


import java.sql.Timestamp;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class memberDTO {
	
	@NotBlank(message = "이 항목은 필수 입력 값입니다.")
	@Pattern(message = "잘못된 아이디 형식입니다."
			,regexp = "^[a-zA-Z0-9_-]{3,10}")
	private String memberId;
	
	@NotBlank(message = "이 항목은 필수 입력 값입니다.")
	@Pattern(message ="비밀번호는 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요."
			,regexp = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,16}$")
	private String memberPassword;
	
	@NotBlank(message = "이 항목은 필수 입력 값입니다.")
	@Pattern(message ="비밀번호는 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요."
	,regexp = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,16}$")
	private String memberPasswordCheck;
	
	
	@NotBlank(message = "이 항목은 필수 입력 값입니다.")
	@Pattern(message ="이름을 다시 확인해주세요"
	,regexp = "^[a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣]+$")
	private String memberName;
	
	@NotBlank(message = "이 항목은 필수 입력 값입니다.")
	@Pattern(message ="전화번호를 확인해주세요"
	,regexp = "^[0-9-]{13}")
	private String memberPhone;
	
	@NotBlank(message = "이 항목은 필수 입력 값입니다.")
	@Email(message="잘못된 이메일 형식입니다.")
	private String memberEmail;
	
	private String memberReferenceId;
	
	private Timestamp memberSignUpDate;
	
	private int memberPostcode;
	
	@NotBlank(message = "이 항목은 필수 입력 값입니다.")
	private String memberAddress;
	
	@NotBlank(message = "이 항목은 필수 입력 값입니다.")
	private String memberDetailAddress;
	
	private String memberExtraAddress;
	
	private long memberPoint;
}
