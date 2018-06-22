package com.lin.Entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "customer", catalog = "shop", uniqueConstraints = @UniqueConstraint(columnNames = "nickname"))
public class Customer implements Serializable {

    private static final long serialVersionUID = -1133297262634557911L;

    private String id;
    private String nickname;
    private String username;
    private String password;
    private String telephone;
    private String imgurl;
    private String location;
    private Set<Order> orders = new HashSet<Order>();

    public Customer() {
    }

    public Customer(String id, String nickname, String username, String password, String telephone, String location) {
        this.id = id;
        this.nickname = nickname;
        this.username = username;
        this.password = password;
        this.telephone = telephone;
        this.location = location;
    }

    public Customer(String id, String nickname, String username, String password, String telephone, String imgurl,
                    String location, Set<Order> orders) {
        this.id = id;
        this.nickname = nickname;
        this.username = username;
        this.password = password;
        this.telephone = telephone;
        this.imgurl = imgurl;
        this.location = location;
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

    @Column(name = "nickname", unique = true, nullable = false, length = 45)
    public String getNickname() {
        return this.nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    @Column(name = "username", nullable = false, length = 45)
    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Column(name = "password", nullable = false, length = 45)
    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Column(name = "telephone", length = 45)
    public String getTelephone() {
        return this.telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    @Column(name = "imgurl", length = 45)
    public String getImgurl() {
        return this.imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }

    @Column(name = "location", length = 45)
    public String getLocation() {
        return this.location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "customer")
    public Set<Order> getOrders() {
        return this.orders;
    }

    public void setOrders(Set<Order> orders) {
        this.orders = orders;
    }
}
