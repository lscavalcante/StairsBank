package com.lscavalcante.stairsbank.dto.user;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class ForgetPasswordDTO {
    @Email
    @NotBlank
    private String email;
}
