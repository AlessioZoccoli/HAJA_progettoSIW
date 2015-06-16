package com.haja.models;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by alessio on 22/05/15.
 * Project: HAJA_progettoSIW
 * Package: com.haja.models
 */


@Entity(name = "orders")
public class Order implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    /* active/inactive */
    @Basic
    private String state = "active";

    @ManyToOne
    private User user;

    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern="dd/MM/yyyy")
    private Date creationDate = new java.util.Date();

    @Basic
    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern="dd/MM/yyyy")
    private Date closingDate;

    @Basic
    @Column(nullable = true)
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern="dd/MM/yyyy")
    private Date evasionDate;

    @OneToMany(fetch = FetchType.EAGER, cascade=CascadeType.ALL)
    private List<OrderLine> orderLines;


    public Long getId() {return id;}

    public void setId(Long id) {
        this.id = id;
    }

    public String getState() {return state;}

    /*Disattivazione dell'ordine. Vedere Carrello*/
    public void deactivate(){ this.setState("inactive");}

    public void setState(String state) {
        this.state = state;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Date getClosingDate() {
        return closingDate;
    }

    public void setClosingDate(Date closingDate) {
        this.closingDate = closingDate;
    }

    public Date getEvasionDate() {return evasionDate;}

    public void setEvasionDate(Date evasionDate) {
        this.evasionDate = evasionDate;
    }

    public List<OrderLine> getOrderLines() {
        return orderLines;
    }

    public void setOrderLines(List<OrderLine> orderLines) {
        this.orderLines = orderLines;
    }
}
