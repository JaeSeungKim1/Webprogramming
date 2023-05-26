package com.refrigerator.service;

import com.refrigerator.ifs.CrudInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

@Component
public abstract class BaseService<Req, Res, Entity> implements CrudInterface<Req, Res> {

    @Autowired(required = false) // 필수는 아니다라는 의미
    protected JpaRepository<Entity, Long> baseRepository;
}
