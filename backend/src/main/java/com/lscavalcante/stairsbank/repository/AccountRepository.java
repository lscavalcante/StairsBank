package com.lscavalcante.stairsbank.repository;

import com.lscavalcante.stairsbank.model.account.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface AccountRepository extends JpaRepository<Account, Long> {
}
