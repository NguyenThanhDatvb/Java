package com.example.nguyenthihaiyenph53124asm1.DAO;

import com.example.nguyenthihaiyenph53124asm1.Entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface ProductDAO extends JpaRepository<Product, Integer> {
    List<Product> findByCategory_Id(int categoryId); // Sử dụng Category_Id

    List<Product> findAllByNameLike(String keywords);


        @Query("FROM Product o WHERE o.name LIKE ?1")
    Page<Product> findByKeywords(String keywords, Pageable pageable);
}
