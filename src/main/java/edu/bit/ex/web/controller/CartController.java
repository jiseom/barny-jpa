package edu.bit.ex.web.controller;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.account.CurrentAccount;
import edu.bit.ex.domain.cart.Cart;
import edu.bit.ex.domain.product.Product;
import edu.bit.ex.vo.account.MemberContext;
import edu.bit.ex.web.dto.CreateCartForm;
import edu.bit.ex.web.dto.DeleteCartForm;
import edu.bit.ex.web.dto.UpdateCartForm;
import edu.bit.ex.web.service.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RequestMapping("/cart")
@RequiredArgsConstructor
@Controller
public class CartController {

    private final CartService cartService;

    @GetMapping()
    public String cartView(@CurrentAccount Account account,
                           Model model) {

        List<Cart> cartList = cartService.getCartList(account);
        model.addAttribute("cartList", cartList);

        Map<String, Object> map = new HashMap<>();

        int sumMoney = cartService.sumMoney(account);
        int fee = sumMoney >= 30000 ? 0 :2500;
        // 배송료 계산 : 3000원 넘으면 배송료가 0, 안넘으면 2500원
        map.put("sumMoney", sumMoney);
        map.put("fee", fee);
        map.put("sum",sumMoney+fee); // 전체 금액
        map.put("count",cartList.size()); // 상품 갯수
        model.addAttribute("map", map);

        return "/cart/cart";
    }

    //장바구니 담기
    @ResponseBody
    @GetMapping ("/addCart")
    public String addCart(@CurrentAccount Account account,
                          Product product,
                          CreateCartForm createCartForm) {
        cartService.addCart(product, account, createCartForm);
        return "success";
    }

    //장바구니 수량 업데이트
    @ResponseBody
    @PostMapping("/update")
    public String updateCart(@CurrentAccount Account account,
                             @RequestBody UpdateCartForm updateCartForm){

        cartService.updateCart(account,updateCartForm);
        return "success";

    }
    

}
