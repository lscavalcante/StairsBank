package com.lscavalcante.stairsbank.service;

import com.lscavalcante.stairsbank.model.account.Account;
import com.lscavalcante.stairsbank.repository.AccountRepository;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

@Service
public class AccountService {

    final private AccountRepository accountRepository;

    AccountService(AccountRepository accountRepository) {
        this.accountRepository = accountRepository;
    }

    public Account createAccount() {
        var account = new Account();
        account.setBalance(new BigDecimal("0"));

        return accountRepository.save(account);
    }

}
