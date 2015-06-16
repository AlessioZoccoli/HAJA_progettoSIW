package com.haja.models;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * Created by alessio on 22/05/15.
 * Project: HAJA_progettoSIW
 * Package: com.haja.models
 */

@Entity
public class OrderLine implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    /*In realtà il prodotto dovrebbe essere noto al db prima della riga ordine (v. PERSIST)*/
    @OneToOne
    private Product product;

    /*del prodotto*/
    @Basic
    @NotNull(message = "campo necessario")
    private Double price;

    @Basic
    @NotNull(message = "campo necessario")
    private Integer quantity;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    private Double subTotal(){
        Double lprice = (this.price)*(this.quantity);
        return lprice;
    }

}
