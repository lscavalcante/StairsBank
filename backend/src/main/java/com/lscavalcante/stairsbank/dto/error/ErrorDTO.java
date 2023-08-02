package com.lscavalcante.stairsbank.dto.error;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ErrorDTO {
    private String message;
    private String exception;
    private Date timeStamp;
    private List<String> errors;

    public ErrorDTO(String message, List<String> errors) {
        this.errors = errors;
        this.message = message;
        this.timeStamp = new Date();
    }

    public ErrorDTO(String message, String exception, List<String> errors) {
        this.errors = errors;
        this.exception = exception;
        this.message = message;
        this.timeStamp = new Date();
    }

    public ErrorDTO(String message) {
        this.message = message;
        this.timeStamp = new Date();
        this.errors = new ArrayList<>();
    }

    public ErrorDTO(String message, String exception) {
        this.message = message;
        this.exception = exception;
        this.timeStamp = new Date();
        this.errors = new ArrayList<>();
    }


}
