package com.example.nguyenthihaiyenph53124asm1.DAO;

import com.example.nguyenthihaiyenph53124asm1.Entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AccountDAO extends JpaRepository<Account, String> {
}
