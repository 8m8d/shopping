package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.DTO.boardDTO;
import com.example.demo.DTO.memberDTO;
import com.example.demo.Service.boardService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class BoardController {

	@Autowired
	private boardService boardService;
	
	// 게시글 작성 페이지
	@GetMapping("boardWrite")
	public String boardWrite(HttpSession session, Model model) {
		memberDTO dto = (memberDTO)session.getAttribute("dto");
		if(dto != null) {
			session.setAttribute("dto", dto);
			model.addAttribute("dto",dto);
			return "boardWrite";
		}else {
			model.addAttribute("signInPlz","로그인 후 이용 가능합니다.");
			return "signIn";
		}
	}
	// 게시글 작성
	@PostMapping("writeOk")
	public String writeOk(@ModelAttribute boardDTO dto, HttpSession session) {
		memberDTO writer = (memberDTO)session.getAttribute("dto");
		if(writer != null) {
			dto.setBoardWriter(writer.getMemberId());
		}
		boardService.insert(dto);
		log.info(" writeOk dto : " + dto);
		return "redirect:/boardList";
	}
	// 게시글 수정 페이지
	@GetMapping("modifyForm")
	public String modifyForm(HttpSession session, @RequestParam("no")int boardNo, Model model) {
		//memberDTO dto = (memberDTO)session.getAttribute("dto");
		model.addAttribute("data",boardService.detailOne(boardNo));
		return "modifyForm";
	}
	// 게시글 수정
	@PostMapping("modifyOk")
	public String modifyOk(HttpSession session, @ModelAttribute boardDTO dto, Model model, RedirectAttributes ra) {
		memberDTO loginMember = (memberDTO)session.getAttribute("dto");
		if(loginMember.getMemberId().equals(dto.getBoardWriter())) {
			log.info("loginMmeber"+loginMember);
			log.info("dto"+dto);
			boardService.update(dto);
			return "redirect:/boardList";
		}else {
			ra.addFlashAttribute("modifyFailed","본인이 작성한 글만 수정이 가능합니다.");
		}
		return "redirect:/boardList";
	}
	// 게시글 목록
	@GetMapping("boardList")
	public String boardList(HttpSession session, Model model) {
		model.addAttribute("list", boardService.boardList());
		memberDTO loginMember = (memberDTO)session.getAttribute("dto");
		if(loginMember != null ) {
			model.addAttribute("isOwner",true);
		}else {
			model.addAttribute("isOwner",false);
		}
		return "boardList";
	}
	
	//내가 쓴 게시글 목록
	@GetMapping("myBoardList")
	public String myboardList(HttpSession session, @ModelAttribute boardDTO dto, Model model) {
		memberDTO writer = (memberDTO)session.getAttribute("dto");
		if(writer != null) {
			dto.setBoardWriter(writer.getMemberId());
			model.addAttribute("dto",boardService.myBoardList(dto));
		}
			
		return "myBoardList";
	}
	
	// 게시글 상세
	@GetMapping("boardDetail")
	public String DetailOne(HttpSession session,@RequestParam("no")int boardNo, Model model) {
		memberDTO loginMember = (memberDTO)session.getAttribute("dto");
		if(loginMember != null) {
			model.addAttribute("loginMember",loginMember);
		}
		
		boardDTO dto  = boardService.detailOne(boardNo);
		if(loginMember != null && loginMember.getMemberId().equals(dto.getBoardWriter())) {
			model.addAttribute("isOwner",true);
		}else {
			model.addAttribute("isOwner",false);
		}
		model.addAttribute("dto", dto);
		return "boardDetail";
	}
	//게시글 삭제
	@GetMapping("/delete")
	public String delete(@RequestParam("no")int boardNo) {
		boardService.delete(boardNo);
		return "redirect:/boardList";
	}
}
