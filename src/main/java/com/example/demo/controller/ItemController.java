package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.DTO.itemDTO;
import com.example.demo.DTO.memberDTO;
import com.example.demo.Service.itemService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ItemController {

	@Autowired
	itemService itemService;
	
	@GetMapping("itemList")
	public String itemList(Model model) {
		model.addAttribute("item",itemService.selectAll());
		return "itemList";
	}
	
	@GetMapping("itemDetail")
	public String itemDetail(HttpSession session, @RequestParam("itemNo")int itemNo,Model model) {
		memberDTO dto = (memberDTO)session.getAttribute("dto");
		model.addAttribute("dto",dto);
		model.addAttribute("item",itemService.detailOne(itemNo));
		return "itemDetail";
	}
	
	@GetMapping("/addItem")
	public String addItem() {
		return "addItem";
	}
	//상품 추가
	@PostMapping("/addItem")
	public String addItemOk(@ModelAttribute itemDTO dto, MultipartFile imgFile, Model model) throws Exception {
		itemService.addItem(dto, imgFile);
		model.addAttribute("item",dto);
		log.info("아이템 추가 : " + dto);
		return "redirect:/itemModifyForm";
	}
	// 상품 수정 페이지
	@GetMapping("itemModifyForm")
	public String itemModify(@ModelAttribute itemDTO dto, Model model) {
		model.addAttribute("item",itemService.selectAll());
		return "itemModifyForm";
	}
	// 상품 수정
	@PostMapping("itemModifyOk")
	public String itemModifyOk(@ModelAttribute itemDTO dto, MultipartFile imgFile) throws Exception {
		itemService.itemUpdate(dto,imgFile);
		return "itemModifyOk";
	}
	// 상품 검색
	@GetMapping("searchItem")
	@ResponseBody
	public List<itemDTO> searchItem(@RequestParam("itemTitle")String itemTitle, Model model) {
	    return itemService.searchItem(itemTitle);
	}
}
