package edu.bit.ex.web.service;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.cart.Cart;
import edu.bit.ex.domain.cart.CartRepository;
import edu.bit.ex.domain.product.Product;
import edu.bit.ex.domain.product.ProductRepository;
import edu.bit.ex.web.dto.CreateCartForm;
import edu.bit.ex.web.dto.DeleteCartForm;
import edu.bit.ex.web.dto.UpdateCartForm;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Transactional
@RequiredArgsConstructor
@Service
public class CartService {

    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final ModelMapper modelMapper;

    /**
     * 장바구니 담기
     */
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
//    @Transactional(readOnly = true)
    public List<Cart> getCartList(Account account) {
        //회원의 카트 가져오기
        List<Cart> cartList = new ArrayList<>();
        //1.현재 로그인한 회원의 장바구니 엔티티를 조회
        List<Cart> accountCart = cartRepository.getAccountCart(account.getId());
        //2. 장바구니에 상품을 한 번도 안담았을 경우 장바구니 엔티티가 없으므로 빈 리스트를 반환
        if (accountCart == null) {
            return cartList;
        }
        //3. 장바구니에 담겨 있는 상품 정보를 조회
        return cartRepository.getAccountCart(account.getId());
    }

}

