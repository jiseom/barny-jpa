package edu.bit.ex.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.bit.ex.service.cart.CartServiceDeprecated;
import edu.bit.ex.vo.account.MemberContext;
import edu.bit.ex.vo.cart.CartVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user/*")  
public class CartControllerDeprecated {
	
	@Autowired
	private CartServiceDeprecated cartService;
	
	// 장바구니 리스트 
	@GetMapping("/cart5")
	public String cart5(Model model, Principal principal,@AuthenticationPrincipal MemberContext ctx) {

		log.info("Principal" + principal.getName());
		log.info("Principal" + ctx.getMemberVO().getMember_idx());
		
      
		// log.info("Principal" + ctx.getMemberVO().getMember_idx());		
		
		List<CartVO> cartList = cartService.cartList(ctx.getMemberVO().getMember_idx());
		
		model.addAttribute("cartList", cartList);
		
		log.info("List<CartVO> cartList" +  cartList);		
		
		
		  Map<String, Object> map = new HashMap<>();		 		

		  int sumMoney = cartService.sumMoney(ctx.getMemberVO().getMember_idx()); 
		  int fee = sumMoney >= 30000 ? 0 :2500; 
		  // 배송료 계산 : 3000원 넘으면 배송료가 0, 안넘으면 2500원
		  
		  map.put("sumMoney", sumMoney); 
		  map.put("fee", fee); 
		  map.put("sum",sumMoney+fee); // 전체 금액 
		  //map.put("cartList", cartList); 
		  map.put("count",cartList.size()); // 상품 갯수

		  model.addAttribute("map", map);
		  
		return "cart/cart5";
	}	
	 	 	
	// 장바구니 담기
	@ResponseBody	 
	@GetMapping("/writeCart")	
	public String writeCart(CartVO cartVO, Principal principal, @AuthenticationPrincipal MemberContext ctx) {
		
		log.info("writeCart() ..");
		
		log.info("principal" + principal.getName());
		log.info("principal" + ctx.getMemberVO().getMember_idx());
		
		log.info("cartVO().." + cartVO);
		
		cartVO.setMember_idx(ctx.getMemberVO().getMember_idx());
		
		cartService.writeCart(cartVO);
		
		return "SUCCESS";
	} 			
	
	// 수량변경
	// update	
	@ResponseBody
    @PostMapping("/updateCart")
    public String updateCart(@RequestBody CartVO cartVO, Principal principal, @AuthenticationPrincipal MemberContext ctx) {
		
    	log.info("updateCart() ..");
		
		log.info("principal" + principal.getName());
		log.info("principal" + ctx.getMemberVO().getMember_idx());
		
		log.info("cartVO().." + cartVO);
		cartVO.setMember_idx(ctx.getMemberVO().getMember_idx());
		
		cartService.modify(cartVO);

        return "SUCCESS";
    }	
    
    // delete by checkbox
	@ResponseBody
    @RequestMapping(value = "/delete")
    public String deleteByCheckbox(HttpServletRequest request, @AuthenticationPrincipal MemberContext ctx) throws Exception {
        String[] deleteByCheckbox = request.getParameterValues("valueArr");
        int size = deleteByCheckbox.length;
        log.info("deleted notice number: " + deleteByCheckbox);
        for(int i=0; i<size; i++) {

            cartService.delete(ctx.getMemberVO().getMember_idx(), Integer.parseInt(deleteByCheckbox[i]));
        }
        return "SUCCESS";
    }
	
}
