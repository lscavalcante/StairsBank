package com.lscavalcante.stairsbank.service;

import com.lscavalcante.stairsbank.dto.user.*;
import com.lscavalcante.stairsbank.model.account.Account;
import com.lscavalcante.stairsbank.model.user.User;
import com.lscavalcante.stairsbank.repository.UserRepository;
import com.lscavalcante.stairsbank.shared.exception.RecordAlreadyExistsException;
import com.lscavalcante.stairsbank.shared.exception.RecordNotFoundException;
import com.lscavalcante.stairsbank.shared.exception.UnknownException;
import com.lscavalcante.stairsbank.shared.security.JwtService;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Random;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadPoolExecutor;

@Service
public class UserService {
    final UserRepository userRepository;
    final AccountService accountService;
    final JwtService jwtService;
    final AuthenticationManager authenticationManager;

    public UserService(UserRepository userRepository, JwtService jwtService, AuthenticationManager authenticationManager, AccountService accountService) {
        this.userRepository = userRepository;
        this.authenticationManager = authenticationManager;
        this.jwtService = jwtService;
        this.accountService = accountService;
    }
    public TokenDTO login(LoginDTO request) {
        try {
            var username = request.getUsername();
            var password = request.getPassword();

            User user = userRepository.findByEmail(username).orElseThrow(
                    () -> new RecordNotFoundException("User not found")
            );

            authenticationManager
                    .authenticate(new UsernamePasswordAuthenticationToken(username, password, new ArrayList<>()));

            return jwtService.createJWT(user);
        } catch (RuntimeException ex) {
            throw ex;
        } catch (Exception ex) {
            throw new UnknownException(ex.getMessage());
        }
    }
    public String createAccount(CreateAccountDTO dto) {
        try {
            if (userRepository.findByEmail(dto.getUsername()).isPresent()) {
                throw new RecordAlreadyExistsException("User already exists");
            }

            User user = new User();
            user.setEmail(dto.getUsername());
            user.setPassword(new BCryptPasswordEncoder().encode(dto.getPassword()));

            Account account = accountService.createAccount();
            user.setAccount(account);

            userRepository.save(user);

            userRepository.save(user);

            return "Account created with success for user " + user.getEmail();
        } catch (RuntimeException ex) {
            throw ex;
        } catch (Exception ex) {
            throw new UnknownException(ex.getMessage());
        }

    }
    public String resetPassword(ResetPasswordDTO dto) {
        try {
            var email = dto.getEmail();
            var resetToken = dto.getResetToken();

            User user = userRepository.findByEmail(email)
                    .orElseThrow(() -> new RecordNotFoundException("User not found"));

            if (verifyResetToken(user, resetToken)) {
                user.setPassword(new BCryptPasswordEncoder().encode(dto.getPassword()));
                user.setResetToken(null);
                user.setResetTokenExpiry(null);
                userRepository.save(user);
                return "Password updated with success";
            }
            throw new RecordNotFoundException("The reset code is invalid try again with another code");

        } catch (RuntimeException ex) {
            throw ex;
        } catch (Exception ex) {
            throw new UnknownException(ex.getMessage());
        }
    }
    public String forgetPassword(ForgetPasswordDTO dto) {
        try {
            var email = dto.getEmail();

            User user = userRepository.findByEmail(email)
                    .orElseThrow(() -> new RecordNotFoundException("User not found"));

            generateResetToken(user);

            return "If the user exists we will send the code for reset the password for e-mail " + user.getEmail();
        } catch (RecordNotFoundException ex) {
            return "If the user exists we will send the code for reset the password for e-mail";
        } catch (RuntimeException ex) {
            throw ex;
        } catch (Exception ex) {
            throw new UnknownException(ex.getMessage());
        }
    }
    private void generateResetToken(User user) {
        Random random = new Random();
        int randomNumber = random.nextInt(999999 - 100000 + 1) + 100000;

        String resetToken = Integer.toString(randomNumber);
        LocalDateTime resetTokenExpiry = LocalDateTime.now().plusMinutes(5);

        user.setResetToken(resetToken);
        user.setResetTokenExpiry(resetTokenExpiry);

        System.out.println(user.getResetToken());
        System.out.println(user.getResetTokenExpiry());

        userRepository.save(user);
        // send the number for e-mail (por e-mail, por exemplo)
        ThreadPoolExecutor executor = (ThreadPoolExecutor) Executors.newFixedThreadPool(1);
        executor.execute(() -> {
            // method or logic to send the email with thread
            // sendResetTokenByEmail(user)
        });

        // executor.shutdown();  // Encerrar o executor quando não for mais necessário
    }
    private boolean verifyResetToken(User user, String token) {
        if (user.getResetToken() == null || user.getResetTokenExpiry() == null) {
            return false;
        }

        LocalDateTime now = LocalDateTime.now();
        if (now.isAfter(user.getResetTokenExpiry())) {
            return false;
        }

        return user.getResetToken().equals(token);
    }

}
