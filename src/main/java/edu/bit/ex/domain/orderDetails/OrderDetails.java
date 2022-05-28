package edu.bit.ex.domain.orderDetails;

import edu.bit.ex.domain.order.Order;
import edu.bit.ex.domain.product.Product;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class OrderDetails {

    @Id @GeneratedValue
    private Long id;

    @ManyToOne
    private Product purchasedProductDetails;

    @ManyToOne
    private Order ordered;

}
