package com.newbaz.model;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.io.Serializable;
import java.util.*;

/**
 * Created by dorsa on 3/2/17.
 */
@Entity
@Table(name = "STUFF")
@Inheritance(strategy = InheritanceType.JOINED)
public class Stuff implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    @Column(name = "ID")
    private Integer id ;

    @NotEmpty
    @Column(name = "NAME", nullable = false)
    private String name;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "CREATE_DATE", nullable = false)
    private Date createDate;

    @ManyToOne
    private User owner;

    @OneToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    @JoinTable(name = "STUFF_FILE",
            joinColumns = {@JoinColumn(name = "STUFF_ID")},
            inverseJoinColumns = {@JoinColumn(name = "FILE_ID")})
    private List<FileBucket> images;

    @Transient
    private List<MultipartFile> files;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "CATEGORY_STUFF",
            joinColumns = { @JoinColumn(name = "STUFF_ID") },
            inverseJoinColumns = { @JoinColumn(name = "CATEGORY_ID") })
    private Set<Category> categories = new HashSet<Category>();

    @Transient
    private String[] categoryItem;


    @Column(name = "STATUS")
    private boolean status;

    @Column(name = "PRICE")
    private String price;

    @Column(name = "CURRENCY")
    private String currency;




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


    public List<MultipartFile> getFiles() {
        return files;
    }

    public void setFiles(List<MultipartFile> files) {
        this.files = files;
    }

    public List<FileBucket> getImages() {
        return images;
    }

    public void setImages(List<FileBucket> images) {
        this.images = images;
    }

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
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

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }
}
