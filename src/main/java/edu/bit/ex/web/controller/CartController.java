package edu.bit.ex.web.controller;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.account.CurrentAccount;
import edu.bit.ex.domain.cart.Cart;
import edu.bit.ex.domain.product.Product;
import edu.bit.ex.vo.account.MemberContext;
import edu.bit.ex.vo.cart.CartVO;
import edu.bit.ex.web.dto.CreateCartForm;
import edu.bit.ex.web.dto.UpdateCartForm;
import edu.bit.ex.web.service.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RequiredArgsConstructor
@Controller
public class CartController {

    private final CartService cartService;

    @GetMapping("/cart")
    public String cartView(@CurrentAccount Account account, Product product,
                           Model model) {
        List<Cart> cartList = cartService.getCartList(account);
        model.addAttribute("cartList", cartList);

        Map<String, Object> map = new HashMap<>();

//        int sumMoney = cartService.sumMoney(account);
//        int fee = sumMoney >= 30000 ? 0 :2500;
//        // 배송료 계산 : 3000원 넘으면 배송료가 0, 안넘으면 2500원
//
//        map.put("sumMoney", sumMoney);
//        map.put("fee", fee);
//        map.put("sum",sumMoney+fee); // 전체 금액
//        //map.put("cartList", cartList);
//        map.put("count",cartList.size()); // 상품 갯수
//
//        model.addAttribute("map", map);


        //productname , price , quantity 조인 되야함
        //

//        Account = Id  -> cartCustomerId
//        account.getId()
//
//        Product = id => selectedItemId
//                selectedItemId. productName
//                        .price
//
//        Cart Quantity -> qaunttity


        //findBySelectItemId()
        //리스트 만든다
        //


        return "/cart/cart5";
    }


//    // 장바구니 리스트
//    @GetMapping("/cart5")
//    public String cart5(Model model, Principal principal, @AuthenticationPrincipal MemberContext ctx) {
//
//
//
//        List<CartVO> cartList = cartService.cartList(ctx.getMemberVO().getMember_idx());
//
//        model.addAttribute("cartList", cartList);
//
//
//        return "cart/cart5";
//    }


    //장바구니 담기
    @ResponseBody
    @GetMapping("/addCart")
    public String addCart(@CurrentAccount Account account,
                          Product product,
                          CreateCartForm createCartForm) {
        cartService.addCart(product, account, createCartForm);
        return "success";
    }


}
