package edu.bit.ex.web.service;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.cart.Cart;
import edu.bit.ex.domain.cart.CartRepository;
import edu.bit.ex.domain.product.Product;
import edu.bit.ex.domain.product.ProductRepository;
import edu.bit.ex.web.dto.CreateCartForm;
import edu.bit.ex.web.dto.UpdateCartForm;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Transactional
@RequiredArgsConstructor
@Service
public class CartService {

    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final ModelMapper modelMapper;

    public Cart addCart(Product product, Account account, CreateCartForm createCartForm) {
        createCartForm.setCartCustomer(account);
        createCartForm.setSelectedItem(product);
        createCartForm.setQuantity(createCartForm.getQuantity());
        Cart cart = modelMapper.map(createCartForm, Cart.class);
        return cartRepository.save(cart);

    }

    /**
     * 나의 장바구니
     */
    @Transactional(readOnly = true)
    public List<Cart> getCartList(Account account) {
        Long CustomerId = account.getId();
        //회원의 카트 가져오기
        //   List<Cart> accountCart = cartRepository.getAccountCart(CustomerId);
        return cartRepository.getAccountCart(CustomerId);
    }


//    public int sumMoney(Account account) {
//        //회원 카트 가져오기
//        Cart accountCart = cartRepository.getAccountCart(account.getId());
//        //해당 회원의 상품 번호로 카트 가져오기
//        List<Cart> findCart = cartRepository.findBySelectedItem(accountCart.getSelectedItem().getId());
//        //카트의 가격과 수량 가져오기
//        int price = 0;
//        int quantity = 0;
//        for (Cart cart : findCart) {
//            price = cart.getSelectedItem().getPrice();
//            quantity = cart.getQuantity();
//
//        }
//        return price * quantity;
////        int price =  findCart.getSelectedItem().getPrice();
////        int quantity = findCart.getQuantity();
//
////        return price * quantity;
//
//    }
}
