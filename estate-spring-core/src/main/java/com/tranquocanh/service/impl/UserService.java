package com.tranquocanh.service.impl;

import com.tranquocanh.converter.UserConverter;
import com.tranquocanh.dto.UserDTO;
import com.tranquocanh.entity.UserEntity;
import com.tranquocanh.repository.UserRepository;
import com.tranquocanh.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService implements IUserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    UserConverter userConverter;
    @Override
    public UserDTO findOneByUserName(String name) {
        UserEntity entity  = userRepository.findOneByUserName(name);
        return userConverter.convertToDTO(entity);
    }

    @Override
    public UserDTO findById(Long id) {
        return userConverter.convertToDTO(userRepository.findById(id));
    }

    @Override
    public void save(UserDTO dto) {
        UserEntity entity = userConverter.convertToEntity(dto);
        userRepository.save(entity);
    }
}
