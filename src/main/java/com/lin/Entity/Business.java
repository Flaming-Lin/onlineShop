package com.lin.Entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "business", catalog = "shop", uniqueConstraints = @UniqueConstraint(columnNames = "nick_name"))
public class Business implements Serializable {

    private static final long serialVersionUID = -913358281892699522L;

    private String id;
    private String nickName;
    private String username;
    private String password;
    private String telephone;
    private String imgurl;
    private Date openDate;
    private String memo;
    private Set<Products> productses = new HashSet<Products>();
    private Set<Order> order = new HashSet<Order>();

    public Business() {
    }

    public Business(String id, String nickName, String username, String password, String telephone, Date openDate) {
        this.id = id;
        this.nickName = nickName;
        this.username = username;
        this.password = password;
        this.telephone = telephone;
        this.openDate = openDate;
    }

    public Business(String id, String nickName, String username, String password, String telephone, String imgurl,
                    Date openDate, String memo, Set<Products> productses) {
        this.id = id;
        this.nickName = nickName;
        this.username = username;
        this.password = password;
        this.telephone = telephone;
        this.imgurl = imgurl;
        this.openDate = openDate;
        this.memo = memo;
        this.productses = productses;
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

    @Column(name = "nick_name", unique = true, nullable = false, length = 45)
    public String getNickName() {
        return this.nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
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

    @Column(name = "imgurl", length = 200)
    public String getImgurl() {
        return this.imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "open_date", nullable = false, length = 10)
    public Date getOpenDate() {
        return this.openDate;
    }

    public void setOpenDate(Date openDate) {
        this.openDate = openDate;
    }

    @Column(name = "memo", length = 200)
    public String getMemo() {
        return this.memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "business")
    @OrderBy("onselldate ASC")
    public Set<Products> getProductses() {
        return this.productses;
    }

    public void setProductses(Set<Products> productses) {
        this.productses = productses;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "business")
    @OrderBy("date ASC")
    public Set<Order> getOrder() {
        return order;
    }

    public void setOrder(Set<Order> order) {
        this.order = order;
    }
}
