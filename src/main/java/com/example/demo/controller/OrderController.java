package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.DTO.cartDTO;
import com.example.demo.DTO.itemDTO;
import com.example.demo.DTO.memberDTO;
import com.example.demo.DTO.orderDTO;
import com.example.demo.DTO.orderDetailDTO;
import com.example.demo.Service.cartService;
import com.example.demo.Service.itemService;
import com.example.demo.Service.memberService;
import com.example.demo.Service.orderDetailService;
import com.example.demo.Service.orderService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class OrderController {

	@Autowired
	private cartService cartService;
	
	@Autowired
	private orderService orderService;
	
	@Autowired
	private memberService memberService;
	
	@Autowired
	private orderDetailService orderDetailService;
	
	@Autowired
	private itemService itemService;
	
//	장바구니 영역		장바구니 영역		장바구니 영역		장바구니 영역		장바구니 영역		장바구니 영역		장바구니 영역		장바구니 영역
	
	@GetMapping("cart")
	public String cart(HttpSession session, @ModelAttribute cartDTO dto, Model model) {
		memberDTO loginMember = (memberDTO)session.getAttribute("dto");
		if(loginMember != null) {
			dto.setMemberId(loginMember.getMemberId());
			//List<cartDTO> userCart = cartService.myCartList(dto);
			model.addAttribute("dto",cartService.myCartList(dto));
			model.addAttribute("loginMember",loginMember);
			return "cart";
		}else {
			model.addAttribute("loginError","로그인 후에 이용가능합니다.");
			log.info("loginError: {}", model.getAttribute("loginError"));
			return "signIn";
		}
	}
	
	@PostMapping("addCart")
	public String addCart(@ModelAttribute cartDTO dto, @RequestParam("itemNo")int itemNo, @RequestParam("memberId")String memberId) {
		if(cartService.cartItemCheck(itemNo,memberId)) {
			return "redirect:/";
		}
		cartService.addCart(dto);
		return "addCart";
	}
	@PostMapping("cartItemDelete")
	public String cartItemDelete(@ModelAttribute cartDTO dto, @RequestParam(value="checkArr[]") List<String> checkArr) {
		int cartNo = 0;
		for(String CheckdcartNo : checkArr) {
			cartNo = Integer.parseInt(CheckdcartNo);
			log.info("카트 넘버 : " + cartNo);
			cartService.cartItemDelete(cartNo);
		}
		return "redirect:/cart";
	}
	
	@PostMapping("cartQuantityUpdate")
	public String cartUpdate(@ModelAttribute cartDTO dto,@RequestParam("cartNo")int cartNo ,@RequestParam("cartQuantity")int cartQuantity) {
		log.info("카트번호"+cartNo);
		log.info("수량"+cartQuantity);
		cartService.cartQuantityUpdate(cartNo, cartQuantity);
		log.info("수량변경 목록 ////// " +"카트번호 : " + cartNo + "수량 : " +cartQuantity   );
		return "cartQuantityUpdate";
	}
	
	// 주문하기		주문하기		주문하기		주문하기		주문하기		주문하기		주문하기		주문하기		주문하기		주문하기
	

	// 장바구니에서 체크한 상품 주문 페이지 
	@GetMapping("cartBuyItem")
	public String addOrder(HttpSession session, orderDTO dto, Model model) {
		memberDTO loginMember = (memberDTO)session.getAttribute("dto");
		dto.setMemberId(loginMember.getMemberId());
		model.addAttribute("loginMember",loginMember);
		return "cartBuyItem";
	}
	// 바로구매 클릭시 주문 페이지
	@GetMapping("nowBuyItem")
	public String addOrderNow(HttpSession session, orderDTO dto, Model model) {
		memberDTO loginMember = (memberDTO)session.getAttribute("dto");
		dto.setMemberId(loginMember.getMemberId());
		model.addAttribute("loginMember",loginMember);
//		orderService.addOrder(dto);
		return "cartBuyItem";
	}
	// 장바구니에서 체크한 상품 구매버튼 클릭하면 정보 넘겨주기
	@PostMapping("cartBuyItem")
	public String buyItem(@RequestParam(value="chkbox[]") String[] chkbox,
						@RequestParam("deliveryCharge")int deliveryCharge ,
						@RequestParam("buyItemPoint")int buyItemPoint ,HttpSession session, orderDTO dto, Model model) {
		memberDTO loginMember = (memberDTO)session.getAttribute("dto");
		List<cartDTO> cartItems = new ArrayList<>();
		
		for(String cartNoStr : chkbox) {
			int cartNo = Integer.parseInt(cartNoStr);
			cartDTO cartItem = cartService.getCartItem(cartNo);
			cartItems.add(cartItem);
		}
		log.info("cartItems: {}", cartItems);
		session.setAttribute("cartItems", cartItems);
		Object obj = session.getAttribute("cartItems");
		log.info("obj >>>>>>>>>>>>> " + obj);
		model.addAttribute("cartItems",obj);
		session.setAttribute("deliveryCharge", deliveryCharge);
		session.setAttribute("buyItemPoint", buyItemPoint);
		return "cartBuyItem";
	}
	
	// 결제 후에 DB에 저장
	@PostMapping("orderFinal")
	public String addOrder(@RequestParam("memberPoint")int memberPoint, 
							@RequestParam(value="cartNos[]")List<String>cartNos,
							@RequestParam("recipientName")String recipientName,
							@RequestParam("recipientPhone")String recipientPhone,
							@RequestParam("deliveryPostcode")int deliveryPostcode,
							@RequestParam("deliveryAddress")String deliveryAddress,
							@RequestParam("deliveryDetailAddress")String deliveryDetailAddress,
							@RequestParam("deliveryExtraAddress")String deliveryExtraAddress,
							@RequestParam("deliveryCharge")int deliveryCharge,
							@RequestParam("orderTotalPrice")int orderTotalPrice,
							HttpSession session, orderDTO dto) {
		// 현재 로그인한 회원 정보 가져오기
		memberDTO loginMember = (memberDTO)session.getAttribute("dto");
		// 주문에 회원 정보 및 멤버 포인트 설정
		dto.setMemberId(loginMember.getMemberId());
		loginMember.setMemberPoint(memberPoint);
		log.info("멤버포인트" + memberPoint);
		// 결제 후에 멤버 포인트 업데이트
		memberService.memberPointUpdate(loginMember);
		
		// 세션에서 장바구니 아이템 목록 가져오기
		List<cartDTO> cartItems = (List<cartDTO>) session.getAttribute("cartItems");
		// 주문 추가 및 주문번호 설정
		int orderNo = orderService.addOrder(dto);
		dto.setOrderNo(orderNo);
		// 주문 상세 내역 생성
		List<orderDetailDTO> orderDetails = new ArrayList<>();
		int money =0;
		for(cartDTO cartItem : cartItems) {
			itemDTO item = itemService.detailOne(cartItem.getItemNo());
			cartItem.calculateCartTotalPrice(item);
			log.info("돈 :" +cartItem.getCartTotalPrice());
			orderDetailDTO orderDetail = new orderDetailDTO();
		    orderDetail.setOrderNo(orderNo); // 주문 번호 설정
		    orderDetail.setItemNo(cartItem.getItemNo()); // 상품 번호 설정
		    orderDetail.setOrderDetailQuantity(cartItem.getCartQuantity()); // 주문 수량 설정
		    orderDetail.setOrderDetailAmount(cartItem.getCartTotalPrice());
		    orderDetails.add(orderDetail); // 주문 상세 내역 리스트에 추가
		    log.info("주문 완료할 카트번호: " + orderDetails);
		}
		
		// 주문한 상품은 장바구니에서 삭제
		log.info("삭제할 카트번호 : " + cartNos);
		int cartNo = 0;
		for (String DeletecartNos : cartNos) {
			cartNo = Integer.parseInt(DeletecartNos);
			cartService.cartItemDelete(cartNo);
	    }
		
		// 주문 정보에 수령자 및 배송 정보 설정
		dto.setRecipientName(recipientName);
		dto.setRecipientPhone(recipientPhone);
		dto.setDeliveryAddress(deliveryAddress);
		dto.setDeliveryDetailAddress(deliveryDetailAddress);
		dto.setDeliveryExtraAddress(deliveryExtraAddress);
		dto.setDeliveryCharge(deliveryCharge);
		dto.setOrderTotalPrice(orderTotalPrice);
		
		// orderDetail 테이블에 DB추가
		orderDetailService.insertOrder(orderDetails);
		log.info("오더번호 : " + dto);
		return "orderFinal";
	}
	
	// 주문정보		주문정보		주문정보		주문정보		주문정보		주문정보		주문정보		주문정보		주문정보		주문정보
	
	// 주문한 정보 가져오기
	@GetMapping("myOrderList")
	public String selectAll(HttpSession session, @ModelAttribute orderDTO dto, Model model ) {
		memberDTO loginMember = (memberDTO) session.getAttribute("dto");
		dto.setMemberId(loginMember.getMemberId());
		if(dto != null) {
			List<orderDTO> orderList = orderService.orderSelectAll(dto.getMemberId());
			model.addAttribute("dto",orderList);
			for(orderDTO order : orderList) {
				log.info("Order DTO: " + order.toString());
				int orderNo = order.getOrderNo();
				String orderTitle = order.getItemTitle();
				log.info("dto : " + order);
				log.info("상품명 : " + orderTitle);
				log.info("개수 : " + orderDetailService.orderCount(orderNo));
				model.addAttribute("orderListCount",orderDetailService.orderCount(orderNo));
			}
		}
		
		return "myOrderList";
	}
	
	@GetMapping("myOrderListDelete")
	public String orderListDelete(@RequestParam("orderNo")int orderNo) {
		orderService.orderListDelete(orderNo);
		log.info("삭제 된 주문번호  : " + orderNo);
		return "ridirect:/myOrderList";
	}
	
	@GetMapping("myOrderDetailList")
	public String orderDetailList(@ModelAttribute orderDetailDTO oddto, @RequestParam("orderNo")int orderNo, Model model) {
		oddto.setOrderNo(orderNo);
		log.info("oddto : "+oddto);
		model.addAttribute("orderDetailList",orderDetailService.orderDetailList(orderNo));
		return "myOrderDetailList";
	}

}
