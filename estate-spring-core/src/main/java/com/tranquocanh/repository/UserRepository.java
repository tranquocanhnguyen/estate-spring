package com.tranquocanh.repository;

import com.tranquocanh.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<UserEntity, Long> {
    UserEntity findOneByUserName(String name);
    UserEntity findOneByUserNameAndStatus(String name, int status);

}
