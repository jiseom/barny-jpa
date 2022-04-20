package edu.bit.ex.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.bit.ex.service.cart.CartServiceDeprecated;
import edu.bit.ex.service.cart.OrderService;
import edu.bit.ex.service.member.MemberService;
import edu.bit.ex.vo.account.MemberContext;
import edu.bit.ex.vo.cart.CartVO;
import edu.bit.ex.vo.cart.OrderPaymentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class OrderController {
	
	@Autowired
	private CartServiceDeprecated cartService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private MemberService memberService;
	
	// 장바구니, 주문자 리스트 
	@GetMapping("/user/order")
	public String order(Model model, Principal principal,@AuthenticationPrincipal MemberContext ctx) {

		log.info("Principal" + principal.getName());
		log.info("Principal" + ctx.getMemberVO().getMember_idx());
						
		List<CartVO> cartList = cartService.cartList(ctx.getMemberVO().getMember_idx());
		List<OrderPaymentVO> orderList = orderService.orderList(ctx.getMemberVO().getMember_idx());
		
		model.addAttribute("cartList", cartList);
		model.addAttribute("orderList", orderList); 
		
		log.info("List<CartVO> cartList" +  cartList);
		log.info("List<OrderPaymentVO> orderList" +  orderList);
		
		  Map<String, Object> map = new HashMap<>();		 		

		  int sumMoney = orderService.sumMoney(ctx.getMemberVO().getMember_idx()); 
		  int fee = sumMoney >= 30000 ? 0 :2500; 
		  // 배송료 계산 : 3000원 넘으면 배송료가 0, 안넘으면 2500원
		  
		  map.put("sumMoney", sumMoney); 
		  map.put("fee", fee); 
		  map.put("sum",sumMoney+fee); // 전체 금액 
		  //map.put("cartList", cartList); 
		  map.put("count",cartList.size()); // 상품 갯수

		  model.addAttribute("map", map);
		  
		return "order/order";
	}	
					
	@ResponseBody	 
	/* @GetMapping("/user/insertOrder") */
	@RequestMapping(value="/user/insertOrder", method = {RequestMethod.POST})
	public String insertOrder(OrderPaymentVO orderPaymentVO, Principal principal, @AuthenticationPrincipal MemberContext ctx) {
		
		log.info("insertOrder() ..");
		
		log.info("principal" + principal.getName());
		log.info("principal" + ctx.getMemberVO().getMember_idx());
		
		log.info("orderDetailVO().." + orderPaymentVO);
		
		orderPaymentVO.setMember_idx(ctx.getMemberVO().getMember_idx());
		
		orderService.insertOrder(orderPaymentVO);
		
		return "SUCCESS";
	} 	
	
	// 적립금 적립
	@ResponseBody	 
	@GetMapping("/user/insertPoint")	
	public String insertPoint(OrderPaymentVO orderPaymentVO, Principal principal, @AuthenticationPrincipal MemberContext ctx) {
		
		log.info("insertPoint() ..");
		
		log.info("principal" + principal.getName());
		log.info("principal" + ctx.getMemberVO().getMember_idx());
		
		log.info("orderPaymentVO().." + orderPaymentVO);
		
		orderPaymentVO.setMember_idx(ctx.getMemberVO().getMember_idx());
		
		orderService.insertPoint(orderPaymentVO);
		
		return "SUCCESS";
	} 	
	
	@GetMapping("/orderPage")
	public String orderPage() {
		return "order/orderPage";
	}
	
	
}
