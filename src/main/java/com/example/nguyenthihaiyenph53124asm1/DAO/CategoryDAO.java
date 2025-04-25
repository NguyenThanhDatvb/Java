package com.example.nguyenthihaiyenph53124asm1.DAO;

import com.example.nguyenthihaiyenph53124asm1.Entity.Category;
import com.example.nguyenthihaiyenph53124asm1.Entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CategoryDAO extends JpaRepository<Category, Integer> {
}

