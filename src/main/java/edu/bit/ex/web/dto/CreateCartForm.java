package edu.bit.ex.web.dto;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.product.Product;
import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class CreateCartForm {

    private Account cartCustomer;
    private Product selectedItem;
    private int quantity;

}
