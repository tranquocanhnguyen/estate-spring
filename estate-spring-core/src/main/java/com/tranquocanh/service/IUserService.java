package com.tranquocanh.service;

import com.tranquocanh.dto.UserDTO;

public interface IUserService {
    UserDTO findOneByUserName(String name);
    UserDTO findById(Long id);
    void save(UserDTO dto);
}
