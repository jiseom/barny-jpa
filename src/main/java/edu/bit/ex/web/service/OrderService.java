package edu.bit.ex.web.service;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.order.Order;
import edu.bit.ex.domain.order.OrderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@RequiredArgsConstructor
@Transactional
@Service
public class OrderService {

private final OrderRepository orderRepository;

    /**
     * 회원의 주문정보 가져오기
     */
    public List<Order> getOrderList(Account account) {
       return  orderRepository.getAccountOrderList(account.getId());

    }
}
