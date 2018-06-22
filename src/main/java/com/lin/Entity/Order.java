package com.lin.Entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "order", catalog = "shop")
public class Order implements Serializable {

    private static final long serialVersionUID = 7796558875008168340L;

    private String id;
    private Business business;
    private Customer customer;
    private Products products;
    private String product;
    private String customer_1;
    private int number;
    private double totalprice;
    private Date date;
    private String comment;
    private String state;

    public Order() {
    }

    public Order(String id, Customer customer, Products products, String product, String customer_1, int number,
                 double totalprice, Date date, String state) {
        this.id = id;
        this.customer = customer;
        this.products = products;
        this.product = product;
        this.customer_1 = customer_1;
        this.number = number;
        this.totalprice = totalprice;
        this.date = date;
        this.state = state;
    }

    public Order(String id, Customer customer, Products products, String product, String customer_1, int number,
                 double totalprice, Date date, String comment, String state) {
        this.id = id;
        this.customer = customer;
        this.products = products;
        this.product = product;
        this.customer_1 = customer_1;
        this.number = number;
        this.totalprice = totalprice;
        this.date = date;
        this.comment = comment;
        this.state = state;
    }

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid")
    @Column(name = "id", unique = true, nullable = false, length = 36)
    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "businessid")
    public Business getBusiness() {
        return business;
    }

    public void setBusiness(Business business) {
        this.business = business;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "cosid")
    public Customer getCustomer() {
        return this.customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "proid")
    public Products getProducts() {
        return this.products;
    }

    public void setProducts(Products products) {
        this.products = products;
    }

    @Column(name = "product", length = 45)
    public String getProduct() {
        return this.product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    @Column(name = "customer", length = 45)
    public String getCustomer_1() {
        return this.customer_1;
    }

    public void setCustomer_1(String customer_1) {
        this.customer_1 = customer_1;
    }

    @Column(name = "number")
    public int getNumber() {
        return this.number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    @Column(name = "totalprice", precision = 22, scale = 0)
    public double getTotalprice() {
        return this.totalprice;
    }

    public void setTotalprice(double totalprice) {
        this.totalprice = totalprice;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "date", length = 10)
    public Date getDate() {
        return this.date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Column(name = "comment", length = 200)
    public String getComment() {
        return this.comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Column(name = "state", length = 45)
    public String getState() {
        return this.state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
