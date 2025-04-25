package com.example.nguyenthihaiyenph53124asm1.Service;

import com.example.nguyenthihaiyenph53124asm1.DAO.ProductDAO;
import com.example.nguyenthihaiyenph53124asm1.Entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;


@Service
public class ProductService {
    @Autowired
    private ProductDAO productRepository;


    public Page<Product> getAllProducts(Pageable pageable) {
        return productRepository.findAll(pageable);
    }

    public void save(Product product) {
        productRepository.save(product);
    }

    public Product findById(Integer id) {
        return productRepository.findById(id).orElse(null);
    }

    public void delete(Integer id) {
        productRepository.deleteById(id);
    }
}
