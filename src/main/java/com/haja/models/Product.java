package com.haja.models;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.List;

@NamedQuery(name = "Product.findAvailableProducts", query = "SELECT p FROM Product p WHERE p.quantity > 0")
@Entity
public class Product implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Basic
    @Column(unique = true)
    @NotNull(message = "campo necessario")
    private String name;

    @Basic
    private String description;

    @Basic
    @Min(value = 0)
    @NotNull(message = "campo necessario")
    private Double price;

    @Basic
    @NotNull(message = "campo necessario")
    private Integer quantity;

    /*
    @ManyToMany(mappedBy = "products", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    private List<Supplier> suppliers;
    */

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    /*
    public List<Supplier> getSuppliers() {
        return suppliers;
    }

    public void setSuppliers(List<Supplier> suppliers) {
        this.suppliers = suppliers;
    }
    */

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", quantity=" + quantity +
                '}';
    }

    public void decr(Integer quantity) {
        this.quantity -= quantity;

    }
}