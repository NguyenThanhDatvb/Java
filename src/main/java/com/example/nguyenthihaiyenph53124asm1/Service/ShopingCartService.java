package com.example.nguyenthihaiyenph53124asm1.Service;



import com.example.nguyenthihaiyenph53124asm1.Entity.Cart;

import java.util.Collection;

public interface ShopingCartService {


    Cart add(Integer id);

    void remove(int id);

    Cart update(int proID, int quantity);

    void clear();

    Collection<Cart> getAll();

    int getCount();

    double getAmount();
}
