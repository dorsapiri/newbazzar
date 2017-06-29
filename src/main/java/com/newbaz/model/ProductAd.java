package com.newbaz.model;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by dorsa on 5/2/17.
 */
@Entity
@Table(name = "PRODUCT_ADS")
public class ProductAd {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Integer id ;


    @Column(name = "NAME", nullable = false)
    private String name;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "CREATE_DATE", nullable = false)
    private Date createDate;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "CATEGORY_ADS",
            joinColumns = { @JoinColumn(name = "ADS_ID") },
            inverseJoinColumns = { @JoinColumn(name = "CATEGORY_ID") })
    private Set<Category> categories = new HashSet<Category>();

    @Transient
    private String[] categoryItem;


    @Column(name = "NUMBER_ITEMS", nullable = false)
    private String numberItems;


    @OneToOne
    private Unit unit;


    @Column(name = "DETAILS", nullable = false)
    private String prductDetails;


    @Column(name = "NAME_FAMILY", nullable = false)
    private String nameFamily;


    @Size(max = 11,min = 11, message = "please insert the true number!")
    @Pattern(regexp = "[0][9][0-9]{9}",message = "the number is false!")
    @Column(name = "MOBILE", nullable = false)
    private String mobile;


    @Size(max = 11,min = 11, message = "Please insert the true number with code!")
    @Pattern(regexp = "[0][2][0-9]{9}",message = "The number is false!")
    @Column(name = "TEL", nullable = false)
    private String telephone;


    @Email
    @Column(name = "EMAIL", nullable = false)
    private String email;


    @Column(name = "TYPE",nullable = false)
    private String type;

    @Transient
    private String sUnit;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Set<Category> getCategories() {
        return categories;
    }

    public void setCategories(Set<Category> categories) {
        this.categories = categories;
    }

    public String[] getCategoryItem() {
        return categoryItem;
    }

    public void setCategoryItem(String[] categoryItem) {
        this.categoryItem = categoryItem;
    }

    public String getNumberItems() {
        return numberItems;
    }

    public void setNumberItems(String numberItems) {
        this.numberItems = numberItems;
    }

    public Unit getUnit() {
        return unit;
    }

    public void setUnit(Unit unit) {
        this.unit = unit;
    }

    public String getPrductDetails() {
        return prductDetails;
    }

    public void setPrductDetails(String prductDetails) {
        this.prductDetails = prductDetails;
    }

    public String getNameFamily() {
        return nameFamily;
    }

    public void setNameFamily(String nameFamily) {
        this.nameFamily = nameFamily;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getsUnit() {
        return sUnit;
    }

    public void setsUnit(String sUnit) {
        this.sUnit = sUnit;
    }
}
