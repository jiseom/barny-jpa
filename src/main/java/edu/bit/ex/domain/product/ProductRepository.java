package edu.bit.ex.domain.product;


import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Id;
import java.util.List;
import java.util.Optional;

@Transactional(readOnly = true)
public interface ProductRepository extends JpaRepository<Product, Long> {

    List<Product> findAllByProductType(ProductType productType);

    Optional<Product> findById(Long id);

    @Query("SELECT p " +
            "FROM Product p " +
            "WHERE p.id =:id " +
            "AND p.productType " +
            "IN(:productType)" +
            "ORDER BY p.id DESC")
    List<Product> findByIdInProductType(@Param("id") Long id, List<ProductType> productType);

    //회원의 구독내역
    @Query("SELECT p " +
            "FROM Product p " +
            "WHERE p.id =:id " +
            "AND p.productType=:productType")
    List<Product> findByAccountAndProductType(@Param("id")Long id,ProductType productType);

}