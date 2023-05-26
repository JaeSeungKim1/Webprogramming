package com.refrigerator.model.enumClass;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum OrderDetailStatus {

    COMPLETE(0, "완료", "상품을 준비한 상태"),
    ORDERING(1, "주문중", "상품을 주문중인 상태"),
    CONFIRM(2, "확인중", "상품을 확인중인 상태")
    ;

    private Integer id;
    private String title;
    private String description;
}