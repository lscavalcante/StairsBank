package com.lscavalcante.stairsbank.controller;

import com.lscavalcante.stairsbank.dto.response.DefaultResponseDTO;
import com.lscavalcante.stairsbank.dto.user.*;
import com.lscavalcante.stairsbank.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    private final UserService userService;

    AuthController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/login")
    public ResponseEntity<TokenDTO> login(@Validated @RequestBody LoginDTO loginDTO) {
        return ResponseEntity.status(HttpStatus.OK).body(userService.login(loginDTO));
    }

    @PostMapping("/createAccount")
    public ResponseEntity<DefaultResponseDTO> createAccount(@Validated @RequestBody CreateAccountDTO createAccountDTO) {

        return ResponseEntity.status(HttpStatus.OK).body(new DefaultResponseDTO(userService.createAccount(createAccountDTO)));
    }

    @PostMapping("/forgetPassword")
    public ResponseEntity<DefaultResponseDTO> forgetPassword(@Validated @RequestBody ForgetPasswordDTO dto) {
        return ResponseEntity.status(HttpStatus.OK).body(new DefaultResponseDTO(userService.forgetPassword(dto)));
    }

    @PostMapping("/resetPassword")
    public ResponseEntity<DefaultResponseDTO> resetPassword(@Validated @RequestBody ResetPasswordDTO dto) {
        return ResponseEntity.status(HttpStatus.OK).body(new DefaultResponseDTO(userService.resetPassword(dto)));
    }

}

