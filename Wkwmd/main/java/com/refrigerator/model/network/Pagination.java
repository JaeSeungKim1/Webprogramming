package com.refrigerator.model.network;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain = true)
public class Pagination {

    private Integer totalPages; // 페이지 총 개수
    private Long totalElements; // 데이터 총 개수
    private Integer currentPage; // 현재 페이지
    private Integer currentElements; // 현재 데이터 개수
}
