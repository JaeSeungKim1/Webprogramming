package com.refrigerator.model.entity;



import com.refrigerator.model.enumClass.OrderGroupStatus;
import com.refrigerator.model.enumClass.OrderType;
import com.refrigerator.model.enumClass.PaymentType;
import lombok.*;
import lombok.experimental.Accessors;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@ToString(exclude = {"user", "orderDetailList"})
@EntityListeners(AuditingEntityListener.class)
@Builder // Builder 패턴 사용
@Accessors(chain = true)
public class OrderGroup {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Enumerated(EnumType.STRING)
    private OrderGroupStatus status; // 완료, 준비중

    @Enumerated(EnumType.STRING)
    private OrderType orderType; // 주문의 형태 - 일괄 / 개별

    private String revAddress;

    private String revName;

    @Enumerated(EnumType.STRING)
    private PaymentType paymentType; // 결제수단 - 카드 / 현금

    private BigDecimal totalPrice;

    private Integer totalQuantity;

    private LocalDateTime orderAt;

    private LocalDateTime arrivalDate;

    @CreatedDate
    private LocalDateTime createdAt;

    @CreatedBy
    private String createdBy;

    @LastModifiedDate
    private LocalDateTime updatedAt;

    @LastModifiedBy
    private String updatedBy;

    // ========== 연관 관계 ==========

    // OrderGroup의 입장에서는 User와 N : 1관계
    @ManyToOne
    private User user; // 외래키

    // OrderGroup의 입장에서는 OrderDetail과 1 : N 관계
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "orderGroup")
    private List<OrderDetail> orderDetailList;
}