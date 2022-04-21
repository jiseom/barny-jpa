package edu.bit.ex.domain.cart;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.product.Product;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Setter
@Getter
@Entity
public class Cart {

    @Id
    @GeneratedValue
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    private Account cartCustomer;

    @ManyToOne
    private Product selectedItem;

    private int quantity;

    private int money; //아임포트

    public void updateQuantity(int quantity) {
        this.quantity = quantity;
    }

}
