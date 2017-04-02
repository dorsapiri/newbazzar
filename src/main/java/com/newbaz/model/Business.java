package com.newbaz.model;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by dorsa on 3/31/17.
 */
@Entity
@Table(name = "BUSINESS")
public class Business{

    @Id
    @NotEmpty
    @GeneratedValue
    @Column(name = "ID")
    private Integer id;

    @NotEmpty
    @OneToOne
    @JoinColumn(name = "USER_ID")
    private User user;

    @NotEmpty
    @ManyToMany
    @JoinTable(name = "BUSINESS_CATEGORY",joinColumns = {@JoinColumn(name = "BUSINESS_ID")},
            inverseJoinColumns = {@JoinColumn(name = "CATEGORY_ID")})
    private Set<Category> categories;

    @NotEmpty
    @Column(name = "BUSINESS_TYPE")
    private String businessType;

    @NotEmpty
    @Column(name = "BUSINESS_NAME")
    private String businessName;

    @NotEmpty
    @ManyToMany
    @JoinTable(name = "BUSINESS_TAG",joinColumns = {@JoinColumn(name = "BUSINESS_ID")},
            inverseJoinColumns = {@JoinColumn(name = "TAG_ID")})
    private Set<Tag> tags;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Set<Category> getCategories() {
        return categories;
    }

    public void setCategories(Set<Category> categories) {
        this.categories = categories;
    }

    public String getBusinessType() {
        return businessType;
    }

    public void setBusinessType(String businessType) {
        this.businessType = businessType;
    }

    public String getBusinessName() {
        return businessName;
    }

    public void setBusinessName(String businessName) {
        this.businessName = businessName;
    }

    public Set<Tag> getTags() {
        return tags;
    }

    public void setTags(Set<Tag> tags) {
        this.tags = tags;
    }
}
