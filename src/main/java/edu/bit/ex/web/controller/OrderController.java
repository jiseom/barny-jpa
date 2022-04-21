package edu.bit.ex.web.controller;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.account.CurrentAccount;
import edu.bit.ex.domain.cart.Cart;
import edu.bit.ex.domain.order.Order;
import edu.bit.ex.web.service.CartService;
import edu.bit.ex.web.service.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@RequestMapping("/order")
@Controller
public class OrderController {

    private final CartService cartService;
    private final OrderService orderService;

    //주문서 보여주기
    @GetMapping()
    public String order(@CurrentAccount Account account,
                        Model model) {

        List<Cart> cartList = cartService.getCartList(account);
        List<Order> orderList = orderService.getOrderList(account);

        model.addAttribute("cartList", cartList);
        model.addAttribute("orderList", orderList);

        Map<String, Object> map = new HashMap<>();

        int sumMoney = cartService.sumMoney(account);
        int fee = sumMoney >= 30000 ? 0 : 2500;
        // 배송료 계산 : 3000원 넘으면 배송료가 0, 안넘으면 2500원
        map.put("sumMoney", sumMoney);
        map.put("fee", fee);
        map.put("sum", sumMoney + fee); // 전체 금액
        map.put("count", cartList.size()); // 상품 갯수
        model.addAttribute("map", map);

        return "order/order";

    }



}
