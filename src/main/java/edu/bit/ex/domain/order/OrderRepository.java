package edu.bit.ex.domain.order;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(readOnly = true)
public interface OrderRepository extends JpaRepository<Order, Long> {

    /**
     * 회원의 주문정보 가져오기
     */
    @Query("SELECT o " +
            "FROM Order o " +
            "LEFT JOIN o.orderCustomer a " +
            "WHERE o.orderCustomer.id=:id " +
            "ORDER BY o.id DESC")
    List<Order> getAccountOrderList(@Param("id") Long id);

}
