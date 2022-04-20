package edu.bit.ex.domain.cart;

import edu.bit.ex.domain.product.Product;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(readOnly = true)
public interface CartRepository extends JpaRepository<Cart, Long> {

    @Query("SELECT c " +
            "FROM Cart c " +
            "LEFT JOIN c.cartCustomer a " +
            " ON a.id =:id ")
    List<Cart> getAccountCart(@Param("id") Long id);


    /**
     * 장바구니 내역
     */
    @Query("SELECT c " +
            " FROM  Cart c ,Product p" +
            "LEFT JOIN c.selectedItem p WHERE c.id =:cartCustomerId " +
            "AND p.id in(:selectedItemId)")
    List<Cart> getCartList(@Param("id") Long cartCustomerId, List<Product>selectedItemId);

//
//    /**
//     * 상품으로 장바구니 찾기
//     */
//    @Query("SELECT c " +
//            "FROM Cart c ,Product p , Account a LEFT JOIN c.selectedItem WHERE a.id =:cartCustomerId AND p.id =:selectedItemId")
//    Cart findBySelectedItem(@Param("id")Long cartCustomerId,@Param("id") Long selectedItemId);


    //      <!-- 장바구니 총 합계 -->
//    <select id="sumMoney" resultType="int">
//	<![CDATA[
//    select nvl(sum(price*product_qty), 0) from cart c, product p
//    where c.product_id = p.product_id and member_idx = #{member_idx}
//	]]>
//	</select>
//}
//






//<!-- 장바구니 목록 출력 -->
//    <select id="cartList" resultType="edu.bit.ex.vo.cart.CartVO">
//        <![CDATA[
//    SELECT I.IMAGE_ROUTE, M.MEMBER_IDX, P.PRODUCT_ID, P.PRODUCT_NAME, P.PRICE, C.PRODUCT_QTY
//    FROM MEMBER M, PRODUCT P, CART C, IMAGE I
//    WHERE M.MEMBER_IDX = C.MEMBER_IDX AND P.PRODUCT_ID = C.PRODUCT_ID AND I.PRODUCT_ID = P.PRODUCT_ID AND M.MEMBER_IDX = #{MEMBER_ID}
//    ORDER BY MEMBER_IDX ASC
//        ]]>
//    </select>






}
