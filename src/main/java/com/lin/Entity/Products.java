package com.lin.Entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "products", catalog = "shop")
public class Products implements Serializable {

    private static final long serialVersionUID = 5499376740201670550L;

    private String id;
    private Business business;
    private String name;
    private String type;
    private String imgurl;
    private double price;
    private String memo;
    private int instock;
    private int selled;
    private Date onselldate;
    private Set<Order> orders = new HashSet<Order>();

    public Products() {
    }

    public Products(String id, Business business, String name, String type, String imgurl, double price, String memo,
                    int instock, int selled, Date onselldate) {
        this.id = id;
        this.business = business;
        this.name = name;
        this.type = type;
        this.imgurl = imgurl;
        this.price = price;
        this.memo = memo;
        this.instock = instock;
        this.selled = selled;
        this.onselldate = onselldate;
    }

    public Products(String id, Business business, String name, String type, String imgurl, double price, String memo,
                    int instock, int selled, Date onselldate, Set<Order> orders) {
        this.id = id;
        this.business = business;
        this.name = name;
        this.type = type;
        this.imgurl = imgurl;
        this.price = price;
        this.memo = memo;
        this.instock = instock;
        this.selled = selled;
        this.onselldate = onselldate;
        this.orders = orders;
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

    @JsonIgnoreProperties(value={"products","orders"})
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "businessid", nullable = false)
    public Business getBusiness() {
        return this.business;
    }

    public void setBusiness(Business business) {
        this.business = business;
    }

    @Column(name = "name", nullable = false, length = 45)
    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "type", nullable = false, length = 45)
    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Column(name = "imgurl", nullable = false, length = 200)
    public String getImgurl() {
        return this.imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }

    @Column(name = "price", nullable = false, precision = 22, scale = 0)
    public double getPrice() {
        return this.price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Column(name = "memo", nullable = false, length = 45)
    public String getMemo() {
        return this.memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    @Column(name = "instock", nullable = false)
    public int getInstock() {
        return this.instock;
    }

    public void setInstock(int instock) {
        this.instock = instock;
    }

    @Column(name = "selled", nullable = false)
    public int getSelled() {
        return this.selled;
    }

    public void setSelled(int selled) {
        this.selled = selled;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "onselldate", nullable = false, length = 10)
    public Date getOnselldate() {
        return this.onselldate;
    }

    public void setOnselldate(Date onselldate) {
        this.onselldate = onselldate;
    }

    @JsonIgnoreProperties(value={"business", "customer","products"})
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "products")
    public Set<Order> getOrders() {
        return this.orders;
    }

    public void setOrders(Set<Order> orders) {
        this.orders = orders;
    }
}
