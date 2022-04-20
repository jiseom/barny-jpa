package edu.bit.ex.domain.cart;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.product.Product;
import lombok.Getter;
import lombok.Setter;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Setter
@Getter
@Entity
public class Cart {

    @Id
    @GeneratedValue
    private Long id;

    @ManyToOne
    private Account cartCustomer;

    @ManyToOne
    private Product selectedItem;

    private int quantity;

    private int money ; //아임포트


}
