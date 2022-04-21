package edu.bit.ex.domain.order;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.product.Product;
import javax.persistence.*;
import java.time.LocalDate;


@Table(name="Orders")
@Entity
public class Order {

    @Id @GeneratedValue
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    private Account orderCustomer;

    @ManyToOne
    private Product purchasedItem;

    private int totalPrice;

    private LocalDate orderDate;







}

