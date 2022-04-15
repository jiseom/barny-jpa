package edu.bit.ex.domain.board;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum BoardType {

    /**
     * 공지 게시판/
     * 이벤트/
     * 후기/
     * 주문문의/
     * 상품문의/
     * 배송문의/
     * 기타문의/
     * 답글 게시판
     *
      */

    NOTICE("공지 게시판"),
    EVENT("이벤트"),
    REVIEW("후기"),
    ORDER_INQUIRY("주문문의"),
    PRODUCT_INQUIRY("상품문의"),
    SHIP_INQUIRY("배송문의"),
    ETC_INQUIRY("기타문의"),
    REPLY("답글 게시판");

    private final String value;


}
