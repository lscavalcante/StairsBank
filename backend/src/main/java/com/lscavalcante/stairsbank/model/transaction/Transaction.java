package com.lscavalcante.stairsbank.model.transaction;

import com.lscavalcante.stairsbank.model.user.User;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "transactions")
public class Transaction {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id;

    private BigDecimal amount;

    private String comment;

    @ManyToOne
    @JoinColumn(name = "sender_id")
    private User sender;

    @JoinColumn(name = "receive_id")
    @ManyToOne
    private User receive;

    @ManyToOne()
    @JoinColumn(name = "typeOfTransaction_id")
    private TypeOfTransaction typeOfTransaction;
}
