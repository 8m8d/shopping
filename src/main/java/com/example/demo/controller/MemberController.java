package com.example.demo.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.DTO.memberDTO;
import com.example.demo.Service.itemService;
import com.example.demo.Service.memberService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemberController {
	@Autowired
	private memberService memberService;
	@Autowired
	private itemService itemService;
	
	@GetMapping("/")
	public String index(HttpSession session, Model model) {
		memberDTO dto = (memberDTO) session.getAttribute("dto");
		model.addAttribute("item",itemService.selectAll());
		if(dto != null && !dto.equals("")) {
			session.setAttribute("sessionCheck", true);
			model.addAttribute("dto", dto);
			return "index";
		}else {
			session.invalidate();
			return "index";
		}
	}

	
	// 회원가입 페이지
	@GetMapping("signUp")
	public String signUp() {
		return "signUp";
	}
	// 회원가입 하기
	@PostMapping("signUpOk")
	public String signUpOk(@Valid @ModelAttribute memberDTO dto, Errors errors, Model model) {
		if(errors.hasErrors()){
            // 회원가입 실패시 입력 데이터 값을 유지
            model.addAttribute("dto", dto);

            // 유효성 통과 못한 필드와 메시지를 핸들링
            Map<String, String> validatorResult = memberService.validateHandling(errors);
            for(String key : validatorResult.keySet()){
                model.addAttribute(key, validatorResult.get(key));
                log.info("유효성 검사 부적합 : "+key);
            }
            // 회원가입 페이지로 다시 리턴
            return "signUp";
        }
		memberService.signUpOk(dto);
		model.addAttribute("signupOk","회원가입이 성공적으로 완료되었습니다.");
		log.info("회원가입 정보 : "+dto);
		return "signIn";
	}
	// ID 중복확인
	@GetMapping("idCheck")
	public String idCheck(@RequestParam("memberId")String memberId, @ModelAttribute memberDTO dto) {
		if(memberService.idCheck(memberId)) {
			return "redirect:/signUp";
		}
		return "/";
	}
	
	// 로그인 페이지
	@GetMapping("signIn")
	public String signIn() {
		return "signIn";
	}
	// 로그인 확인
	@PostMapping("signInOk")
	public String signInOk(HttpSession session, @ModelAttribute memberDTO dto, Model model) {
		if(memberService.validationSignin(dto.getMemberId(), dto.getMemberPassword())) {
			String memberId = dto.getMemberId();
			dto = memberService.memberInfo(memberId);
			session.setAttribute("dto", dto);
			model.addAttribute("dto",dto);
			log.info("로그인 정보 : " + dto );
			return "redirect:/";
		}else {
			model.addAttribute("loginError","아이디 또는 비밀번호가 올바르지 않습니다.");
			return "signIn";
		}
	}
	// 로그아웃 하기
	@GetMapping("signOut")
	public String sighOut(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// 회원정보
	@GetMapping("member")
	public String memberAll(Model model){
		model.addAttribute("model",memberService.memberAll());
		return "member";
	}
	
	// 내정보
	@GetMapping("myPage")
	public String myPage(HttpSession session, Model model) {
		memberDTO dto = (memberDTO)session.getAttribute("dto");
		model.addAttribute("dto",dto);
		return "myPage";
	}
	
	// 내정보 수정
	@GetMapping("mypageUpdate")
	public String myPageUpdate(HttpSession session, Model model) {
		memberDTO dto = (memberDTO)session.getAttribute("dto");
		model.addAttribute("dto",dto);
		return "mypageUpdate";
	}
	
	@PostMapping("mypageUpdate")
	public String myPageUpdate(@Valid @ModelAttribute memberDTO dto, Errors errors, HttpSession session, Model model) {
		if(errors.hasErrors()){
            // 유효성 통과 못한 필드와 메시지를 핸들링
            Map<String, String> validatorResult = memberService.validateHandling(errors);
            for(String key : validatorResult.keySet()){
                model.addAttribute(key, validatorResult.get(key));
                log.info("에러"+key);
            }
            // 회원가입 페이지로 다시 리턴
            return "mypageUpdate";
        }
		memberService.myPageUpdate(dto);
		// 수정한 내용을 세션에 다시 저장하여 가져옴
		session.setAttribute("dto",dto);
		model.addAttribute("modifyOk","정보가 수정 되었습니다.");
		model.addAttribute("dto",dto);
		log.info("dto"+dto);
		return "myPage";
	}
}
