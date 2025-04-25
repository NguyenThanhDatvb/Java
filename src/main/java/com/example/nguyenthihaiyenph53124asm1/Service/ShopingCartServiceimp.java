package com.example.nguyenthihaiyenph53124asm1.Service;


import com.example.nguyenthihaiyenph53124asm1.DAO.ProductDAO;
import com.example.nguyenthihaiyenph53124asm1.Entity.Cart;
import com.example.nguyenthihaiyenph53124asm1.Entity.Product;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

@Service
@SessionScope
public class ShopingCartServiceimp implements ShopingCartService {

    private Map<Integer, Cart> products;

    @Autowired
    private ProductDAO productDAO;

    public ShopingCartServiceimp() {
        this.products = new HashMap<>();
    }

    @Override
    public Cart add(Integer id) {
        Product product = productDAO.findById(id).orElse(null);

        if (product == null) {
            throw new RuntimeException("Không tìm thấy sản phẩm có ID = " + id);
        }

        Cart existingCart = products.get(id);
        if (existingCart != null) {
            existingCart.setQuantity(existingCart.getQuantity() + 1);
        } else {
            Cart newCart = new Cart(product, 1);
            products.put(id, newCart);
        }

        return products.get(id);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }

    @Override
    public Cart update(int proID, int quantity) {
        Cart cart = products.get(proID);
        if (cart != null) {
            int newQuantity = cart.getQuantity() + quantity;
            if (newQuantity > 0) {
                cart.setQuantity(newQuantity);
            } else {
                remove(proID);
            }
        }
        return cart;
    }


    @Override
    public void clear() {
        products.clear();
    }


    @Override
    public Collection<Cart> getAll() {
        return products.values();
    }

    @Override
    public int getCount() {
        return products.size();
    }

    @Override
    public double getAmount() {
        return products.values().stream()
                .mapToDouble(cart -> cart.getProduct().getPrice() * cart.getQuantity())
                .sum();
    }




}
