package com.refrigerator.model.network.request;

import com.refrigerator.model.enumClass.AdminUserStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AdminUserApiRequest {

    private Long id;

    private String account;

    private String password;

    private AdminUserStatus status;

    private String role;

    private LocalDateTime lastLoginAt;

    private Integer loginFailCount;

    private LocalDateTime passwordUpdateAt;

    private LocalDateTime registeredAt;

    private LocalDateTime unregisteredAt;
}
