package edu.bit.ex.domain.product;

import lombok.*;

import javax.persistence.*;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Setter
@Getter
@Entity
public class Product {

    @Id
    @GeneratedValue
    private Long id;

    private String productName;

    private int price;

//    private int quantity;

    private int stock;

    @Enumerated(EnumType.STRING)
    private ProductType productType;

    //    private int subscribe;
    //TODO :이미지 테이블 나중에 변경
    @Lob
    private String productImage;


}
