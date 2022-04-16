package edu.bit.ex.domain.product;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum ProductType {

    PACKAGE("패키지"),DRINK("술"), FOOD("안주");
    private final String value;

}
