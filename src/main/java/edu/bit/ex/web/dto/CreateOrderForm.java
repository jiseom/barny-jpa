package edu.bit.ex.web.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CreateOrderForm {

    private Long id;
    private String orderDate;
    private int sumMoney;

}
