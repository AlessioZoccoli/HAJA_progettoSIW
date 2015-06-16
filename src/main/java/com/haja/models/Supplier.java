package com.haja.models;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.io.Serializable;
import java.util.List;

/**
 * Created by Lorenzo Goldoni on 19/05/15.
 */

@Entity
public class Supplier implements Serializable {

        @Id
        @GeneratedValue(strategy = GenerationType.AUTO)
        private Long id;

        /*Non richiesto dalle specifiche ma è una proprietà utile all'utente finale*/
        @Basic
        @NotNull(message = "campo necessario")
        private String name;

        /*partita iva*/
        @Basic
        @NotNull(message = "campo necessario")
        private String iva;

        @Basic
        @NotNull(message = "campo necessario")
        @Column(unique = true)
        private String email;

        @Basic
        private String phone;

        /*
        @ManyToMany
        private List<Product> products;
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

        public String getIva() {
                return iva;
        }

        public void setIva(String iva) {
                this.iva = iva;
        }

        public String getEmail() {
                return email;
        }

        public void setEmail(String email) {
                this.email = email;
        }

        public String getPhone() {
                return phone;
        }

        public void setPhone(String phone) {
                this.phone = phone;
        }

        /*
        public List<Product> getProducts() {
                return products;
        }

        public void setProducts(List<Product> products) {
                this.products = products;
        }
        */


}
