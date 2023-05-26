package com.refrigerator.model.enumClass;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum PartnerStatus {

    REGISTERED(0, "등록", "등록된 상태"),
    UNREGISTERED(1, "해지", "해지된 상태")
    ;

    private Integer id;
    private String title;
    private String description;
}