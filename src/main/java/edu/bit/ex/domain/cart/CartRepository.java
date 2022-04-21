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
            "WHERE c.cartCustomer.id =:id ")
    List<Cart> getAccountCart(@Param("id") Long id);


    /**
     * 장바구니 내역
     */
    @Query("SELECT c " +
            " FROM  Cart c ,Account a " +
            " JOIN c.selectedItem p WHERE c.cartCustomer.id =:cartCustomerId " +
            "AND c.selectedItem.id in(:selectedItemId)")
    List<Cart> getCartList(@Param("id") Long cartCustomerId, List<Product> selectedItemId);

    @Query("SELECT c " +
            " FROM  Cart c  " +
            "LEFT JOIN c.selectedItem p WHERE c.cartCustomer.id =:cartCustomerId " +
            "AND c.selectedItem.id =:id")
    Cart getCart( Long cartCustomerId, @Param("id") Long id);


    void deleteAllByIdIn(List<Long> ids);

}
