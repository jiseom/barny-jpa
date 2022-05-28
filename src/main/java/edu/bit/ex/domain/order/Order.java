package edu.bit.ex.domain.order;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.product.Product;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import edu.bit.ex.web.dto.CreateOrderForm;
import lombok.Data;

import javax.persistence.*;
import java.time.LocalDate;
@AllArgsConstructor
@NoArgsConstructor
@Data
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

    private String orderDate;

    public Order toEntity(CreateOrderForm createOrderForm) {
        this.totalPrice = createOrderForm.getSumMoney();
        this.orderDate = String.valueOf(LocalDate.now());
        return Order.this;
        }






}

