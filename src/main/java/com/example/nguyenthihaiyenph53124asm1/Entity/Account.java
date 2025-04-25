package com.example.nguyenthihaiyenph53124asm1.Entity;

import jakarta.persistence.*;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
@Entity
@Table(name = "Accounts")
public class Account implements Serializable {
    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY) // hoặc AUTO, tùy theo DB
//    private Long id;
    String username;
    String password;
    String fullname;
    String email;
    String photo;
    boolean activated;
    boolean admin;
    @OneToMany(mappedBy = "account")
    List<Order> orders;
}
