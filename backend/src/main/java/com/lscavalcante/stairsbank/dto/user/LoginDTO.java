package com.lscavalcante.stairsbank.dto.user;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

@Data
public class LoginDTO {
    @Email
    @NotEmpty
    private String username;

    @NotEmpty
    private String password;
}
