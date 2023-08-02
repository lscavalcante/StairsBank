package com.lscavalcante.stairsbank.controller;

import com.lscavalcante.stairsbank.dto.user.LoginDTO;
import com.lscavalcante.stairsbank.dto.user.TokenDTO;
import com.lscavalcante.stairsbank.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
public class UserController {

    final private UserService userService;

    UserController(UserService userService) {
        this.userService = userService;
    }
}
