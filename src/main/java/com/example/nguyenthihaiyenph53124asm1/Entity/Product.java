package com.example.nguyenthihaiyenph53124asm1.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Data
@Entity
@Table(name = "Products")
@NoArgsConstructor
@AllArgsConstructor
public class Product implements Serializable {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String name;

    private String image;

    private Double price;

    @Temporal(TemporalType.DATE)
    @Column(name = "Createdate")
    private LocalDate createDate;

    private Boolean available;

    @ManyToOne
    @JoinColumn(name = "Categoryid")
    private Category category;

    @OneToMany(mappedBy = "product")
    private List<OrderDetail> orderDetails;

    public Product(Integer id, String name, String image, Double price, LocalDate createDate) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
        this.createDate = createDate;
    }
}
