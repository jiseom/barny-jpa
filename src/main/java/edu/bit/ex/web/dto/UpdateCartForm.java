package edu.bit.ex.web.dto;

import edu.bit.ex.domain.product.Product;
import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class UpdateCartForm {

    private Long id;
    private int quantity;

}
