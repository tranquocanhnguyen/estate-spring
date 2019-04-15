package com.tranquocanh.controller.api;

import com.tranquocanh.dto.UserDTO;
import com.tranquocanh.entity.UserEntity;
import com.tranquocanh.repository.UserRepository;
import com.tranquocanh.service.IUserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@RestController
public class UserAPI {

    @Autowired
    private IUserService userService;

    @PostMapping("/saveUser")
    public void saveUser(@RequestBody UserDTO userDTO) {
        System.out.println("success full");
        userService.save(userDTO);
    }

    @RequestMapping(value = "/employees", produces = "application/json", method=RequestMethod.PUT)

    public String test() {
      return "mu vo dich";
    }
    @GetMapping("/users")
    public String retrieveAllUsers() {
        System.out.println("xxx");
        return "success";
    }
}
