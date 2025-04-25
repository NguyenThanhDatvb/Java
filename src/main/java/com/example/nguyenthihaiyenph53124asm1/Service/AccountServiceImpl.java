package com.example.nguyenthihaiyenph53124asm1.Service;
import com.example.nguyenthihaiyenph53124asm1.DAO.AccountDAO;
import com.example.nguyenthihaiyenph53124asm1.DAO.AccountService;
import com.example.nguyenthihaiyenph53124asm1.Entity.Account;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class AccountServiceImpl implements AccountService {
    @Autowired
    private AccountDAO accountDAO;

    @Override
    public Account findById(String username) {
        Optional<Account> account = accountDAO.findById(username);
        return account.orElse(null);
    }

}
