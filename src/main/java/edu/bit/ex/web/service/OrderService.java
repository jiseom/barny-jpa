package edu.bit.ex.web.service;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.cart.Cart;
import edu.bit.ex.domain.order.Order;
import edu.bit.ex.domain.order.OrderRepository;
import edu.bit.ex.web.dto.CreateOrderForm;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;

@RequiredArgsConstructor
@Transactional
@Service
public class OrderService {

    private final OrderRepository orderRepository;

    private final ModelMapper modelMapper;
    /**
     * 회원의 주문정보 가져오기
     */
    public List<Order> getOrderList(Account account) {
        return orderRepository.getAccountOrderList(account.getId());

    }

    /**
     * 주문 정보 넣기
     */
    public Order addOrder(Account account, Order order,CreateOrderForm createOrderForm) {

        createOrderForm.setId(account.getId());
        Order addOrder = order.toEntity(createOrderForm);
//        createOrderForm.setSumMoney(createOrderForm.getSumMoney());
//        createOrderForm.setOrderDate(String.valueOf(LocalDate.now()));
//        createCartForm.setSelectedItem(product);
//        Order order = modelMapper.map(createOrderForm, Order.class);
        return orderRepository.save(addOrder);
    }
}
