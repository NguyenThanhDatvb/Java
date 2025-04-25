package com.example.nguyenthihaiyenph53124asm1.DAO;

import com.example.nguyenthihaiyenph53124asm1.Entity.Account;
import com.example.nguyenthihaiyenph53124asm1.Entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderDAO extends JpaRepository<Order, Long> {
}
