package com.refrigerator.model.entity;

import com.refrigerator.model.enumClass.UserStatus;
import lombok.*;
import lombok.experimental.Accessors;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity // == table
@ToString(exclude = {"orderGroupList"}) // 연관관계를 설정하면 Lombok을 통해 오버라이딩된 toString 메소드가 중복되므로 exclude 해줘야함
@EntityListeners(AuditingEntityListener.class)
@Builder // Builder 패턴 사용
@Accessors(chain = true)
// @Table(name="user") 테이블의 이름이 동일하면 생략 가능
public class User {
    // @Column(name="id") 컬럼의 이름이 동일하면 생략 가능
    @Id // 식별자
    @GeneratedValue(strategy = GenerationType.IDENTITY) // 전략 옵션
    private Long id;

    private String account;

    private String password;

    @Enumerated(EnumType.STRING)
    private UserStatus status; // REGISTERED, UNREGISTERED

    private String email;

    private String phoneNumber;

    private LocalDateTime registeredAt;

    private LocalDateTime unregisteredAt;

    @CreatedDate
    private LocalDateTime createdAt;

    @CreatedBy
    private String createdBy;

    @LastModifiedDate
    private LocalDateTime updatedAt;

    @LastModifiedBy
    private String updatedBy;

    // ========== 연관 관계 ==========

    // 1 : N 관계
    // LAZY :
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    private List<OrderGroup> orderGroupList; // orderGroup이 N이므로 List로 받는다

}