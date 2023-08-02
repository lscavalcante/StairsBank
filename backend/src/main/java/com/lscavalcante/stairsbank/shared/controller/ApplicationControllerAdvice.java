package com.lscavalcante.stairsbank.shared.controller;

import com.lscavalcante.stairsbank.dto.error.ErrorDTO;
import com.lscavalcante.stairsbank.dto.user.TokenDTO;
import com.lscavalcante.stairsbank.shared.exception.NotFoundException;
import com.lscavalcante.stairsbank.shared.exception.RecordAlreadyExistsException;
import com.lscavalcante.stairsbank.shared.exception.RecordNotFoundException;
import jakarta.validation.ConstraintViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.List;

/**
 * Controller advice that handles exceptions thrown by the controllers.
 */
@RestControllerAdvice
public class ApplicationControllerAdvice {

    @ExceptionHandler(NotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public String handleNotFoundException(NotFoundException e) {
        return e.getMessage();
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public FieldError[] validationError(MethodArgumentNotValidException ex) {
        BindingResult result = ex.getBindingResult();
        final List<FieldError> fieldErrors = result.getFieldErrors();
        return fieldErrors.toArray(new FieldError[0]);
    }

    @ExceptionHandler(ConstraintViolationException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ErrorDTO handleConstraintViolationException(ConstraintViolationException e) {
        return new ErrorDTO(e.getMessage(), "handleConstraintViolationException");
    }

    @ExceptionHandler(RecordAlreadyExistsException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ErrorDTO handleRecordAlreadyExists(RecordAlreadyExistsException e) {
        return new ErrorDTO(e.getMessage(), "handleRecordAlreadyExists");
    }

    @ExceptionHandler(RecordNotFoundException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ErrorDTO handleRecordNotFoundException(RecordNotFoundException e) {
        return new ErrorDTO(e.getMessage(), "handleRecordNotFoundException");
    }

    @ExceptionHandler(RuntimeException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ErrorDTO handleRuntimeException(RuntimeException e) {
        return new ErrorDTO(e.getMessage(), "handleRuntimeException");
    }
}
