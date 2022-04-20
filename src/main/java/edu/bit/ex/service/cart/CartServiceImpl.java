package edu.bit.ex.service.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.bit.ex.mapper.CartMapper;
import edu.bit.ex.vo.cart.CartVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CartServiceImpl implements CartServiceDeprecated {
    @Autowired
    private CartMapper cartMapper;
    
	/*
	 * @Override public List<CartVO> cartMoney() { return null; }
	 */
    
    // 장바구니 리스트
    @Override
    public List<CartVO> cartList(int member_idx) {
        log.info("cartList()...");
        return cartMapper.cartList(member_idx);
    }

    // 장바구니 담기
	@Override
	public void writeCart(CartVO cartVO) {
		cartMapper.insert(cartVO);
		
	}

	// 장바구니 수정
	@Override
	public void modify(CartVO cartVO) {
		log.info("cartList()..."  + cartVO);
		cartMapper.update(cartVO);
		
	}
	
	// 장바구니 개별 삭제
	@Override
	public void delete(int member_idx, int product_id) {
		cartMapper.delete(member_idx, product_id);
	}
	
	
	// 장바구니 합계
	@Override
	public int sumMoney(int member_idx) {
		return cartMapper.sumMoney(member_idx);
	}
	
	// 장바구니 동일상품 확인
	 @Override
	public int countCart(int member_idx, int product_id) {
		// return cartMapper.countCart(member_idx, product_name);
		return 0;
	 }
		
	// 장바구니에 동일한 상품 있을 시 수량 변경
	@Override
	public void updateCart(CartVO cartVO) {
		// cartMapper.updateCart(cartVO);
		
	}

	@Override
	public void modifyCart(CartVO cartVO) {
		// TODO Auto-generated method stub
		
	}
	
	/*@Override
	public void modifyCart(CartVO cartVO) {
		// cartMapper.modifyCart(cartVO);
		
	}*/

	// 바로구매
	@Override
	public void order2(CartVO cartVO) {
		cartMapper.insert2(cartVO);
		
	}


       


}
